import 'package:flutter/material.dart';

import '../model/Trip.dart';

class TripDetailScreen extends StatelessWidget {
  const TripDetailScreen({Key? key, required this.trip}) : super(key: key);

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                child: Image.asset(
                  trip.image.path,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.35,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  trip.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Departure: ${trip.tripDate.day}/${trip.tripDate.month}/${trip.tripDate.year}",
                  style: const TextStyle(
                      color: Color(0xFFF38000), fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(trip.description, style: const TextStyle(fontSize: 15),)
              ],
            ),
          )
        ],
      ),
    ));
  }
}
