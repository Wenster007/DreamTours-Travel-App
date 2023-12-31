import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constant.dart';

class WelcomeScreen1Content extends StatelessWidget {
  const WelcomeScreen1Content({Key? key}) : super(key: key);

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
                bottom: height * 0.166,
                right: width * 0.05,
                child: Image.asset("assets/images/welcome1/yellowleaf.png")),
            Positioned(
              bottom: height * 0.15,
              right: width * 0.04,
              child: Image.asset(
                "assets/images/welcome1/welcome1.png",
                width: width * 0.9,
                height: height * 0.60,
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
                    "Let's Travel",
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
                    // MaterialButton(
                    //   onPressed: () {
                    //     //on get Started click button.
                    //     markScreensAsSeen();
                    //     Navigator.of(context).pushReplacement(MaterialPageRoute(
                    //       builder: (context) => const SplaceScreen(),
                    //     ));
                    //   },
                    //   color: const Color(0xFFF38000),
                    //   textColor: Colors.white,
                    //   padding: EdgeInsets.symmetric(
                    //     vertical: height * 0.016,
                    //     horizontal: width * 0.07,
                    //   ),
                    //   shape: const RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.all(
                    //       Radius.circular(30),
                    //     ),
                    //   ),
                    //   child: const Text(
                    //     "Get started",
                    //     style: TextStyle(fontSize: 18),
                    //   ),
                    // ),
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
