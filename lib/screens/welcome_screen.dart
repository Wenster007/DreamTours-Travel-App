import 'package:flutter/material.dart';
import 'package:dreamtour/constants/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              SafeArea(
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
              ),
              Container(
                color: Colors.green,
                child: Center(
                  child: Text(
                    'Screen 2',
                    style: kNormalText,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: const Alignment(0, 0.85),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(2, (int index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 15.0,
                    height: 15.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      color: (index == _currentPage)
                          ? kPrimaryColor
                          : kSecondaryColor,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
