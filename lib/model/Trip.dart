import 'dart:io';

class Trip {
  final String title;
  final String days;
  final String description;
  final int price;
  final File image;
  final DateTime tripDate;

  Trip(
      {required this.tripDate,
      required this.title,
      required this.days,
      required this.description,
      required this.price,
      required this.image});


  // Convert Trip object to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'days': days,
      'description': description,
      'price': price,
      'tripDate': tripDate.toIso8601String(), // Convert DateTime to string
      // Save the image path instead of the File object
      'image': image.path, // You can also upload the image to Firebase Storage and save the URL here.
    };
  }

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      title: json['title'],
      days: json['days'],
      description: json['description'],
      price: json['price'],
      image: File(json['image']), // Recreate the File object from the image path
      tripDate: DateTime.parse(json['tripDate']), // Convert the string back to DateTime
    );
  }
}

