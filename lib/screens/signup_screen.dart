import 'package:dreamtour/widgets/signup_text_form_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Image.asset(
                "assets/images/signup/background.png",
                fit: BoxFit.fill,
                width: width * 1.1,
                height: height * 0.6,
              ),
            ),
            Positioned(
              width: width,
              top: height * 0.07,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 33,
                      color: Color(0xFFf38000),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFFFFFFF),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1, 1),
                                blurRadius: 2),
                          ]),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Form(
                        child: Column(
                          children: [
                            const SignUpTextFormField(
                                title: "Name", icon: Icons.person),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            const SignUpTextFormField(
                                title: "Email", icon: Icons.email),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            const SignUpTextFormField(
                                title: "Password", icon: Icons.key),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            const SignUpTextFormField(
                                title: "Confirm Password", icon: Icons.key),
                            SizedBox(
                              height: height * 0.08,
                            ),
                            const Align(alignment: Alignment(-1,-1),

                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: height*0.33,
              left: width*0.22,
              child: MaterialButton(
              onPressed: () {
                //signup button logic here
              },
              color: const Color(0xFFF38000),
              textColor: Colors.white,
              padding: EdgeInsets.symmetric(
                vertical: height * 0.02,
                horizontal: width * 0.18,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: const Text(
                "Sign Up",
                style: TextStyle(fontSize: 24),
              ),
            ),)
          ],
        ),
      ),
    );
  }
}
