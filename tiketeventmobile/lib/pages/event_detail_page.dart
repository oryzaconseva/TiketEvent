import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../api/api_service.dart';
import '../api/AuthService.dart';
import '../model/event.dart';

class EventDetailPage extends StatelessWidget {
  final Event event;
  const EventDetailPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final currencyFormatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    final dateFormatter = DateFormat('EEEE, d MMMM yyyy, HH:mm', 'id_ID');
    DateTime eventDate;
    try {
      eventDate = DateTime.parse(event.date);
    } catch (e) {
      eventDate = DateTime.now();
    }

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            backgroundColor: theme.primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                event.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Image.network(
                event.posterImage,
                width: double.infinity,
                fit: BoxFit.cover,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      child,
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black54],
                            stops: [0.5, 1.0],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.name,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildDetailRow(
                    theme: theme,
                    icon: Icons.calendar_today_outlined,
                    title: 'Tanggal & Waktu',
                    subtitle: dateFormatter.format(eventDate),
                  ),
                  const SizedBox(height: 16),
                  _buildDetailRow(
                    theme: theme,
                    icon: Icons.location_on_outlined,
                    title: 'Lokasi',
                    subtitle: event.location,
                  ),
                  const Divider(height: 40),
                  Text(
                    'Deskripsi Event',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    event.description,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.black.withOpacity(0.7),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Harga',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    currencyFormatter.format(event.price),
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    _showBookingConfirmation(context, event);
                  },
                  child: const Text('Booking Tiket Sekarang'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required ThemeData theme,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: theme.primaryColor, size: 24),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: theme.textTheme.bodyLarge?.copyWith(color: Colors.black.withOpacity(0.7)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showBookingConfirmation(BuildContext context, Event event) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Booking'),
          content: Text('Anda akan mem-booking tiket untuk ${event.name}. Lanjutkan?'),
          actions: [
            TextButton(
              child: const Text('Batal'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Booking'),
              onPressed: () {
                Navigator.of(context).pop();
                _handleBooking(context, event);
              },
            ),
          ],
        );
      },
    );
  }

  void _handleBooking(BuildContext context, Event event) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final authService = Provider.of<AuthService>(context, listen: false);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Dialog(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text("Memproses booking..."),
              ],
            ),
          ),
        );
      },
    );

    try {
      final apiService = Provider.of<ApiService>(context, listen: false);
      bool success = await apiService.createBooking(event.id);
      navigator.pop();

      if (success) {
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text('Booking berhasil!'),
            backgroundColor: Colors.green,
          ),
        );
        navigator.pop();
        authService.notifyListeners();
      } else {
        _showBookingError(context, error: 'Gagal melakukan booking. Status tidak 201.');
      }
    } catch (e) {
      navigator.pop();
      _showBookingError(context, error: e.toString());
    }
  }

  void _showBookingError(BuildContext context, {String? error}) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal booking. ${error ?? 'Terjadi kesalahan.'}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}