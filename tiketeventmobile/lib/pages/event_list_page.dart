import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../api/api_service.dart';
import '../api/AuthService.dart';
import '../model/event.dart';
import 'event_detail_page.dart';

class EventListPage extends StatefulWidget {
  const EventListPage({super.key});
  @override
  _EventListPageState createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  late Future<List<Event>> futureEvents;
  final currencyFormatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
  final dateFormatter = DateFormat('d MMM yyyy, HH:mm', 'id_ID');
  final _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    final apiService = Provider.of<ApiService>(context, listen: false);
    futureEvents = apiService.getEvents();
    _searchController.addListener(() {
      if (mounted) {
        setState(() {
          _searchQuery = _searchController.text;
        });
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _refreshEvents() {
    final apiService = Provider.of<ApiService>(context, listen: false);
    setState(() {
      futureEvents = apiService.getEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                title: Text(
                  'Daftar Event',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: const Offset(1.0, 1.0),
                        blurRadius: 3.0,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ],
                  ),
                ),
                centerTitle: false,
                titlePadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                background: Container(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [theme.primaryColor, Colors.teal.shade300],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Text(
                          'IZZITIX',
                          style: theme.textTheme.headlineLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Temukan event favoritmu di sini',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: TextField(
                            controller: _searchController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              hintText: 'Cari nama event...',
                              hintStyle: TextStyle(color: Colors.white70),
                              icon: Icon(Icons.search, color: Colors.white70),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ];
        },

        body: FutureBuilder<List<Event>>(
          future: futureEvents,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('Belum ada event yang tersedia.'));
            }
            else {
              final allEvents = snapshot.data!;
              final List<Event> filteredEvents;
              if (_searchQuery.isEmpty) {
                filteredEvents = allEvents;
              } else {
                filteredEvents = allEvents
                    .where((event) =>
                    event.name.toLowerCase().contains(_searchQuery.toLowerCase()))
                    .toList();
              }
              if (filteredEvents.isEmpty) {
                return Center(
                  child: Text(
                    'Tidak ada event yang cocok dengan "$_searchQuery"',
                    style: theme.textTheme.titleMedium,
                  ),
                );
              }
              return RefreshIndicator(
                onRefresh: () async => _refreshEvents(),
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: filteredEvents.length,
                  itemBuilder: (context, index) {
                    final event = filteredEvents[index];
                    String formattedDate;
                    try {
                      final date = DateTime.parse(event.date);
                      formattedDate = dateFormatter.format(date);
                    } catch (e) {
                      formattedDate = "Tanggal tidak valid";
                    }
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(bottom: 16.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EventDetailPage(event: event),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  event.posterImage,
                                  height: 180,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (context, child, progress) {
                                    if (progress == null) return child;
                                    return Container(
                                      height: 180,
                                      color: Colors.grey[200],
                                      child: const Center(child: CircularProgressIndicator()),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      height: 180,
                                      color: Colors.grey[200],
                                      child: Center(
                                        child: Icon(Icons.image_not_supported, color: Colors.grey[600], size: 50),
                                      ),
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        event.name,
                                        style: theme.textTheme.titleLarge?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 12.0),
                                      Row(
                                        children: [
                                          Icon(Icons.calendar_today_outlined, size: 16.0, color: theme.primaryColor),
                                          const SizedBox(width: 8.0),
                                          Text(formattedDate, style: theme.textTheme.bodyMedium),
                                        ],
                                      ),
                                      const SizedBox(height: 6.0),
                                      Row(
                                        children: [
                                          Icon(Icons.location_on_outlined, size: 16.0, color: theme.primaryColor),
                                          const SizedBox(width: 8.0),
                                          Expanded(
                                            child: Text(event.location, style: theme.textTheme.bodyMedium, overflow: TextOverflow.ellipsis),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 12,
                              right: 12,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                  color: theme.primaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 5,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  currencyFormatter.format(event.price),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}