import 'dart:io';

import '../model/Trip.dart';

List<Trip> trips = [
  Trip(
    title: "Sunny Beach Getaway",
    days: "5 Days",
    description:
        "3 Days Tour To Kashmir Neelum Valley, Sharda, Kel, Arang kel, RattiGalli Lake\n-Tour Dates: 16,17,18 June\n(Friday To Sunday)\nPick up Points\n-Peshawar -Swabi -Mardan-Islamabad\nPoints To Cover:\n-Muzafarabad- Shesha Morh-KohallaBridge -Dhani Waterfall-Neelum Jhelum Dam-Keran Sector-Line Of Control. -Neelum Valley -Kutton Waterfall-Sharda -Arang kel-Kel-RattiGalli Lake -Dowarian\nFor More Details Plz contact 0332-9118396-03129118396",
    price: 500,
    image: File("assets/images/mainscreen/beach.jpg"),
    tripDate:
        DateTime(2023, 8, 30), // Replace with actual image path if needed.
  ),
  Trip(
    title: "Snowy Mountain Adventure",
    days: "7 Days",
    description: "Experience thrilling adventures in the snowy mountains.",
    price: 800,
    image: File("assets/images/mainscreen/mountain.jpg"),
    // Replace with actual image path if needed.
    tripDate: DateTime(2023, 9, 28),
  ),
  Trip(
    title: "City Explorer Tour",
    days: "3 Days",
    description: "Discover the hidden gems of a vibrant city.",
    price: 350,
    image: File("assets/images/mainscreen/city.jpg"),
    // Replace with actual image path if needed.
    tripDate: DateTime(2023, 10, 20),
  ),
];
