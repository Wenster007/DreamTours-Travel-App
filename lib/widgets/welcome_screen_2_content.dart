import 'package:dreamtour/screens/splace_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constant.dart';

class WelcomeScreen2Content extends StatelessWidget {
  const WelcomeScreen2Content({Key? key}) : super(key: key);

  Future<void> markScreensAsSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenScreens', true);
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              bottom: height * 0.155,
              left: width * 0.05,
              child: Image.asset(
                "assets/images/welcome2/welcome2.png",
                width: width * 0.9,
                height: height * 0.48,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: width * 0.12,
              ),
              width: width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.07,
                  ),
                  Text(
                    "Plan A Trip",
                    style: GoogleFonts.poppins(
                      fontSize: width * 0.1,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Text(
                    "Unleash your wanderlust with our travel app, unlocking limitless destinations and remarkable experiences.",
                    style: GoogleFonts.poppins(
                      fontSize: width * 0.032,
                      color: const Color(0xFF707070),
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(children: [
                    SizedBox(
                      width: height * 0.03,
                    ),
                    MaterialButton(
                      onPressed: () {
                        //on get Started click button.
                        markScreensAsSeen();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const SplaceScreen(),
                        ));
                      },
                      color: const Color(0xFFF38000),
                      textColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.016,
                        horizontal: width * 0.07,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Get started",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
