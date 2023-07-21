import 'package:dreamtour/data/trip_data.dart';
import 'package:dreamtour/screens/trip_detail_screen.dart';
import 'package:dreamtour/widgets/DestinationItem.dart';
import 'package:flutter/material.dart';

class MainContentScreen extends StatelessWidget {
  const MainContentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    List<Widget> _createDestinationItems() {
      List<Widget> result = [];
      for (int i = 0; i < trips.length; i++) {
        result.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TripDetailScreen(trip: trips[i]),
                  ),
                );
              },
              child: DestinationItem(trip: trips[i])),
        ));
      }

      return result;
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 100),
              child: Text(
                "Where would you like to spend your holidays?",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Top Destinations",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {}, //see all click functionality.
                        child: const Text(
                          "See All",
                          style: TextStyle(
                            color: Color(0xFFF38000),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ..._createDestinationItems(),
          ],
        ),
      ),
    );
  }
}
