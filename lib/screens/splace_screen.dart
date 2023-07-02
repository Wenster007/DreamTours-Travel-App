import 'package:flutter/material.dart';

class SplaceScreen extends StatelessWidget {
  const SplaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Transform.scale(
              scaleY: 0.9,
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/images/splace/background.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned( top: 70, left: 100,child: Image.asset("assets/images/splace/1.png",))
        ],
      ),
    );
  }
}
