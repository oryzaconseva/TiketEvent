class Event {
  final int id;
  final String name;
  final String date;
  final String location;
  final int price;
  final String posterImage;
  final String description;

  static const String correctHost = "http://192.168.43.223:8000";
  static const String searchString = "/storage/posters/";

  Event({
    required this.id,
    required this.name,
    required this.date,
    required this.location,
    required this.price,
    required this.posterImage,
    required this.description,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    String imagePath = json['poster_image_url'] ?? '';
    String fullImageUrl;

    int storageIndex = imagePath.indexOf(searchString);

    if (storageIndex != -1) {
      String correctPath = imagePath.substring(storageIndex);
      fullImageUrl = correctHost + correctPath;
    }
    else if (imagePath.startsWith('http')) {
      fullImageUrl = imagePath;
    }
    else {
      fullImageUrl = '';
    }

    return Event(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Nama Event Belum Ada',
      date: json['date'] ?? '2000-01-01 00:00:00',
      location: json['location'] ?? 'Lokasi Belum Ada',
      price: json['price'] ?? 0,
      posterImage: fullImageUrl,
      description: json['description'] ?? 'Tidak ada deskripsi untuk event ini.',
    );
  }
}