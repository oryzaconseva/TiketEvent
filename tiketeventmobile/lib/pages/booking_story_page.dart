import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../api/AuthService.dart';
import '../model/booking.dart';

class BookingHistoryPage extends StatefulWidget {
  const BookingHistoryPage({super.key});

  @override
  State<BookingHistoryPage> createState() => _BookingHistoryPageState();
}

class _BookingHistoryPageState extends State<BookingHistoryPage> {
  late Future<List<Booking>> _historyFuture;
  late AuthService _authService;
  String _selectedStatus = 'Semua';

  @override
  void initState() {
    super.initState();
    _authService = Provider.of<AuthService>(context, listen: false);
    _fetchHistory();
    _authService.addListener(_fetchHistory);
  }

  void _fetchHistory() {
    if (!mounted) {
      return;
    }
    setState(() {
      _historyFuture = _authService.getBookingHistory();
    });
  }

  @override
  void dispose() {
    _authService.removeListener(_fetchHistory);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateFormatter = DateFormat('d MMMM yyyy, HH:mm', 'id_ID');
    final currencyFormatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: true,
                floating: true,
                expandedHeight: 240.0,
                backgroundColor: theme.primaryColor,
                foregroundColor: Colors.white,
                centerTitle: false,

                actions: [
                  IconButton(
                    icon: const Icon(Icons.logout),
                    tooltip: 'Logout',
                    onPressed: () {
                      Provider.of<AuthService>(context, listen: false).logout();
                    },
                  )
                ],

                flexibleSpace: FlexibleSpaceBar(
                  title: const Text(''),
                  titlePadding: EdgeInsets.zero,
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [theme.primaryColor, Colors.teal.shade300],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            'Riwayat Saya',
                            style: theme.textTheme.headlineMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Semua tiket yang kamu pesan ada di sini',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                          const SizedBox(height: 24),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildFilterChip(
                                  context,
                                  'Semua',
                                  isSelected: _selectedStatus == 'Semua',
                                  onTap: () {
                                    setState(() {
                                      _selectedStatus = 'Semua';
                                    });
                                  }
                              ),
                              _buildFilterChip(
                                  context,
                                  'Pending',
                                  isSelected: _selectedStatus == 'Pending',
                                  onTap: () {
                                    setState(() {
                                      _selectedStatus = 'Pending';
                                    });
                                  }
                              ),
                              _buildFilterChip(
                                  context,
                                  'Confirmed',
                                  isSelected: _selectedStatus == 'Confirmed',
                                  onTap: () {
                                    setState(() {
                                      _selectedStatus = 'Confirmed';
                                    });
                                  }
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },

          body: FutureBuilder<List<Booking>>(
            future: _historyFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              else if (snapshot.hasError) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.cloud_off, size: 60, color: theme.colorScheme.error),
                        const SizedBox(height: 16),
                        Text(
                          'Gagal memuat riwayat',
                          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Error: ${snapshot.error}',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: theme.colorScheme.error),
                        ),
                      ],
                    ),
                  ),
                );
              }
              else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.history_toggle_off_outlined, size: 80, color: Colors.grey[400]),
                      const SizedBox(height: 16),
                      Text(
                        'Belum ada riwayat booking.',
                        style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                );
              }
              else {
                final allBookings = snapshot.data!;
                final List<Booking> filteredBookings;
                if (_selectedStatus == 'Semua') {
                  filteredBookings = allBookings;
                } else {
                  filteredBookings = allBookings
                      .where((booking) =>
                  booking.status.toLowerCase() == _selectedStatus.toLowerCase())
                      .toList();
                }
                if (filteredBookings.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off, size: 80, color: Colors.grey[400]),
                        const SizedBox(height: 16),
                        Text(
                          'Tidak ada riwayat dengan status "$_selectedStatus"',
                          style: theme.textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async => _fetchHistory(),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: filteredBookings.length,
                    itemBuilder: (context, index) {
                      final booking = filteredBookings[index];
                      String formattedDate = booking.eventDate;
                      try {
                        final date = DateTime.parse(booking.eventDate);
                        formattedDate = dateFormatter.format(date);
                      } catch (e) { /* biarkan */ }
                      Color statusColor = Colors.grey;
                      Widget? statusMessage;
                      if (booking.status == 'confirmed') {
                        statusColor = Colors.green;
                        statusMessage = Container(
                          padding: const EdgeInsets.all(12.0),
                          width: double.infinity,
                          color: Colors.green.withOpacity(0.05),
                          child: Text(
                            "Silahkan tukar tiket anda di outlet.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.green.shade800, fontStyle: FontStyle.italic),
                          ),
                        );
                      } else if (booking.status == 'pending') {
                        statusColor = Colors.orange;
                      } else {
                        statusColor = Colors.red;
                      }

                      return Card(
                        clipBehavior: Clip.antiAlias,
                        margin: const EdgeInsets.only(bottom: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              booking.eventPosterImage,
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 150,
                                  color: Colors.grey[200],
                                  child: const Center(child: Icon(Icons.image_not_supported, size: 40, color: Colors.grey)),
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          booking.eventName,
                                          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: statusColor.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          booking.status.toUpperCase(),
                                          style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_today_outlined, size: 16, color: theme.primaryColor),
                                      const SizedBox(width: 8),
                                      Text(formattedDate, style: theme.textTheme.bodyMedium),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on_outlined, size: 16, color: theme.primaryColor),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          booking.eventLocation,
                                          style: theme.textTheme.bodyMedium,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(height: 24),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${booking.quantity} Tiket', style: theme.textTheme.bodyMedium),
                                      Text(
                                        currencyFormatter.format(booking.totalPrice),
                                        style: theme.textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: theme.primaryColor,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            if (statusMessage != null)
                              statusMessage,
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ));
  }

  Widget _buildFilterChip(BuildContext context, String label, {bool isSelected = false, required VoidCallback onTap}) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        margin: const EdgeInsets.only(right: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? theme.primaryColor : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}