import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>();

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
                    "Login",
                    style: TextStyle(
                      fontSize: 33,
                      color: Color(0xFFf38000),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: IntrinsicHeight(
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
                          key: _key,
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  label: Text(
                                    "Email",
                                    style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontSize: 16,
                                    ),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.mail,
                                    color: Color(0xFF463EC9),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      !value.contains("@") ||
                                      value.trim().length <= 1) {
                                    return "Incorrect Email Format";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  label: Text(
                                    "Password",
                                    style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontSize: 16,
                                    ),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.key,
                                    color: Color(0xFF463EC9),
                                  ),
                                ),
                                validator: (value) {
                                  //check the password with the database
                                },
                                keyboardType: TextInputType.text,
                                obscureText: true,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text("Forgot Password?", style: TextStyle(color: Colors.grey)),
                                  ),
                                ],
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  MaterialButton(
                    onPressed: () {},
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
                      "Login",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
