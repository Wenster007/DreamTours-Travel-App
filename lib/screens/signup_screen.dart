import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _userName = "";
  String _userEmail = "";
  String _userPassword = "";
  String _userConfirmPassword = "";

  void addToFireBase() async{
    final url = Uri.https(
        "dummy-59b5d-default-rtdb.firebaseio.com", "users.json");

    await http.post(
      url,
      headers: {
        "Content_Type": "application/json",
      },
      body: json.encode({
        "user_name": _userName,
        "user_email": _userEmail,
        "user_password": _userPassword
      }),
    );

  }

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
                mainAxisSize: MainAxisSize.min,
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
                                    "Name",
                                    style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontSize: 16,
                                    ),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.person,
                                    color: Color(0xFF463EC9),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.trim().length <= 1) {
                                    return "Must be between 1 and 50 characters";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  if (value == null) {
                                    return;
                                  }

                                  _userName = value;
                                },
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
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
                                onSaved: (value) {
                                  if (value == null) {
                                    return;
                                  }

                                  _userEmail = value;
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
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.trim().length < 8) {
                                    return "Password must be atleast 8 characters";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  if (value == null) {
                                    return;
                                  }
                                  _userPassword = value;
                                },
                                keyboardType: TextInputType.text,
                                obscureText: true,
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  label: Text(
                                    "Confirm Password",
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
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.trim().length < 8 ||
                                      _userConfirmPassword != _userPassword) {
                                    return "Password is not same";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  if (value == null) {
                                    return;
                                  }
                                  _userConfirmPassword = value;
                                },
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.03,),
                  MaterialButton(
                    onPressed: () {
                      _key.currentState!.save();

                      final isCorrect = _key.currentState!.validate();

                      if (isCorrect) {
                        addToFireBase();
                        Navigator.of(context).pop();
                      }
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
