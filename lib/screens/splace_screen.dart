import 'package:flutter/material.dart';

class SplaceScreen extends StatelessWidget {
  const SplaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Transform.scale(
                scaleY: 0.95,
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  "assets/images/splace/background.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: height * 0.12,
              left: width * 0.14,
              child: Image.asset(
                "assets/images/splace/1.png",
                width: width * 0.11,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: height * 0.105,
              left: width * 0.1,
              child: Image.asset(
                "assets/images/splace/2.png",
                width: width * 0.06,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: height * 0.12,
              right: width * 0.09,
              child: Image.asset(
                "assets/images/splace/3.png",
                width: width * 0.085,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: height * 0.185,
              left: width * 0.43,
              child: Image.asset(
                "assets/images/splace/4.png",
                width: width * 0.085,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: height * 0.22,
              right: width * 0.06,
              child: Image.asset(
                "assets/images/splace/5.png",
                width: width * 0.12,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              bottom: height * 0.12,
              left: width * 0.07,
              child: MaterialButton(
                onPressed: () {
                  //login button function
                },
                color: const Color(0xFFF38000),
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.022,
                  horizontal: width * 0.35,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
            Positioned(
              bottom: height * 0.03,
              left: width * 0.07,
              child: MaterialButton(
                onPressed: () {
                  //create account button function
                },
                color: const Color(0xFFF38000),
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.022,
                  horizontal: width * 0.225,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: const Text(
                  "Create Account",
                  style: TextStyle(fontSize: 22),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
