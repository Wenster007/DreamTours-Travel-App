import 'package:dreamtour/widgets/welcome_screen1_content.dart';
import 'package:dreamtour/widgets/welcome_screen_2_content.dart';
import 'package:flutter/material.dart';
import 'package:dreamtour/constants/constant.dart';

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
            children: const [
              WelcomeScreen1Content(),
              WelcomeScreen2Content(),
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
