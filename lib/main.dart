import 'package:dreamtour/screens/splace_screen.dart';
import 'package:dreamtour/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<bool> hasSeenScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('hasSeenScreens') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: hasSeenScreen(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          //this tells if the connection is established
          final bool hasSeen = snapshot.data!;

          if (hasSeen) {
            return const MaterialApp(home: SplaceScreen(),);
          } else {
            return const MaterialApp(home: WelcomeScreen(),);
          }
        } else {
          return const MaterialApp(home: Scaffold(
              body: Center(child: Text("Problem is connecting"),)),);
        }
      },
    );

    // return const MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: WelcomeScreen(),
    // );
  }
}
