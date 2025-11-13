import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/booking.dart';
import '../model/event.dart';
import 'StorageService.dart';


class ApiService {
  final String baseUrl = "http://192.168.43.223:8001/api";
  final StorageService _storageService = StorageService();

  Future<Map<String, String>> _getAuthHeaders() async {
    final token = await _storageService.readToken();
    if (token == null) {
      throw Exception('Token tidak ditemukan. Silakan login ulang.');
    }
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future<List<Event>> getEvents() async {
    try {
      final headers = await _getAuthHeaders();
      final response = await http.get(
        Uri.parse('$baseUrl/events'),
        headers: headers,
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => Event.fromJson(data)).toList();
      } else {
        throw Exception('Gagal memuat data events');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<bool> createBooking(int eventId) async {
    try {
      final headers = await _getAuthHeaders();
      final body = json.encode({
        'event_id': eventId,
        'quantity': 1,
      });
      final response = await http.post(
        Uri.parse('$baseUrl/bookings'),
        headers: headers,
        body: body,
      );

      print('--- BOOKING API DEBUG ---');
      print('STATUS CODE: ${response.statusCode}');
      print('RESPONSE BODY: ${response.body}');

      return response.statusCode == 201;
    } catch (e) {
      print('ERROR SAAT BOOKING: $e');
      throw Exception('Error: $e');
    }
  }
}