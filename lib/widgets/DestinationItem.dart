import 'package:flutter/material.dart';

import '../model/Trip.dart';

class DestinationItem extends StatelessWidget {
  const DestinationItem({Key? key, required this.trip}) : super(key: key);

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(trip.image.path)),
        SizedBox(
          height: height * 0.02,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width*0.6,
                child: Text(
                  trip.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                "PKR ${trip.price}",
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                trip.days,
                style: const TextStyle(
                    color: Colors.blue, fontSize: 19, fontWeight: FontWeight.w500),
              ),
              Text("Departure: ${trip.tripDate.day}/${trip.tripDate.month}/${trip.tripDate.year}", style: const TextStyle(color: Color(0xFFF38000), fontWeight: FontWeight.bold),)
            ],
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
      ]),
    );
  }
}
