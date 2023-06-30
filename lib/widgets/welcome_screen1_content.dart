import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constant.dart';


class WelcomeScreen1Content extends StatelessWidget {
  const WelcomeScreen1Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Stack(children: [
          Container(
            padding: const EdgeInsets.only(left: 40),
            width: 304,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Text(
                  "Let's Travel",
                  style: GoogleFonts.poppins(
                    fontSize: 33,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
                Text(
                  "Unleash your wanderlust with our travel app, unlocking limitless destinations and remarkable experiences.",
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: const Color(0xFF707070),
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(children: [
                  const SizedBox(
                    width: 20,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: const Color(0xFFF38000),
                    textColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 28),
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(30)),
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
          Positioned(
              bottom: 140,
              left: -50,
              child: Image.asset(
                "assets/images/welcome1/welcome1.png",
                width: 500,
                height: 470,
                fit: BoxFit.contain,
              )),
        ]),
      ),
    );
  }
}
