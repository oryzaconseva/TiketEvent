import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/booking.dart';
import 'StorageService.dart';

class AuthService with ChangeNotifier {
  final StorageService _storageService = StorageService();
  final String baseUrl = "http://192.168.43.223:8001/api";

  String? _token;
  String? get token => _token;
  bool get isAuthenticated => _token != null;

  AuthService() {
    _tryAutoLogin();
  }

  void _tryAutoLogin() async {
    _token = await _storageService.readToken();
    if (_token != null) {
      notifyListeners();
    }
  }

  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);

      _token = responseData['access_token'];

      if (_token == null) {
        throw Exception('Token tidak ditemukan di response login.');
      }
      await _storageService.writeToken(_token!);
      notifyListeners();
    } else {
      throw Exception('Email atau password salah');
    }
  }

  Future<bool> register(
      String name, String email, String password, String passwordConfirmation
      ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
      body: json.encode({
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
      }),
    );

    print('--- REGISTER API DEBUG ---');
    print('STATUS CODE: ${response.statusCode}');
    print('RESPONSE BODY: ${response.body}');

    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    } else {
      String errorMessage = response.body;
      try {
        var jsonError = json.decode(response.body);
        errorMessage = jsonError['message'] ?? response.body;
        if (jsonError['errors'] != null) {
          errorMessage = jsonError['errors'].values.first[0];
        }
      } catch (_) {
      }
      throw Exception(errorMessage);
    }
  }

  Future<void> logout() async {
    _token = null;
    await _storageService.deleteToken();
    notifyListeners();
  }

  Future<List<Booking>> getBookingHistory() async {
    final token = await _storageService.readToken();
    if (token == null) return [];
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/my-bookings'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print('--- BOOKING HISTORY API DEBUG ---');
      print('STATUS CODE: ${response.statusCode}');
      print('RESPONSE BODY: ${response.body}');

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => Booking.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat riwayat booking: ${response.statusCode}');
      }
    } catch (e) {
      print('Error memuat riwayat booking: $e');
      return [];
    }
  }
}