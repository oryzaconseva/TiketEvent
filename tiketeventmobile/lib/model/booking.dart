class Booking {
  final int id;
  final String status;
  final int quantity;
  final int totalPrice;
  final String eventName;
  final String eventDate;
  final String eventLocation;
  final String eventPosterImage;

  static const String correctHost = "http://192.168.43.223:8000";
  static const String searchString = "/storage/posters/";

  Booking({
    required this.id,
    required this.status,
    required this.quantity,
    required this.totalPrice,
    required this.eventName,
    required this.eventDate,
    required this.eventLocation,
    required this.eventPosterImage,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> eventData = {};
    if (json['event'] != null && json['event'] is Map) {
      eventData = json['event'] as Map<String, dynamic>;
    }

    String imagePath = eventData['poster_image_url'] ?? '';
    String fullImageUrl;
    int storageIndex = imagePath.indexOf(searchString);

    if (storageIndex != -1) {
      String correctPath = imagePath.substring(storageIndex);
      fullImageUrl = correctHost + correctPath;
    } else if (imagePath.startsWith('http')) {
      fullImageUrl = imagePath;
    } else {
      fullImageUrl = '';
    }

    return Booking(
      id: json['id'] ?? 0,
      status: json['status'] ?? 'pending',
      quantity: json['quantity'] ?? 1,
      totalPrice: json['total_price'] ?? 0,
      eventName: eventData['name'] ?? 'Nama Event Tidak Ditemukan',
      eventDate: eventData['date'] ?? '2000-01-01 00:00:00',
      eventLocation: eventData['location'] ?? 'Lokasi Tidak Ditemukan',
      eventPosterImage: fullImageUrl,
    );
  }
}