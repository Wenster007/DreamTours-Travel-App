import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _emailError;
  String? _passError;
  String firebasePass = "";
  String firebaseEmail = "";

  //-------------==========================================-----------------------

  void checkEmailInFirebase(String email) async {
    final url =
        Uri.https("dummy-59b5d-default-rtdb.firebaseio.com", "users.json");
    final response = await http.get(url);

    final Map<String, dynamic> listData = json.decode(response.body);

    for (var data in listData.entries) {
      if (data.value["user_email"] == email) {
        firebaseEmail = data.value["user_email"];
      }
    }
  }

  void checkPasswordInFirebase(String pass) async {
    final url =
        Uri.https("dummy-59b5d-default-rtdb.firebaseio.com", "users.json");
    final response = await http.get(url);

    final Map<String, dynamic> listData = json.decode(response.body);

    for (var data in listData.entries) {
      if (data.value["user_email"] == firebaseEmail) {
        if(data.value["user_password"] == pass){
          firebasePass = data.value["user_password"];
        }
      }
    }
  }

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
                                controller: _emailController,
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
                                  checkEmailInFirebase(_emailController.text);

                                  if (value == null || value.isEmpty) {
                                    _emailError = "Please Enter an Email";
                                    return _emailError;
                                  }

                                  if (_emailController.text != firebaseEmail) {
                                    _emailError = "The Email is Incorrect";
                                    return _emailError;
                                  }

                                  setState(() {
                                    _emailError = null;
                                  });

                                  return _emailError;
                                },
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              TextFormField(
                                controller: _passwordController,
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
                                  checkPasswordInFirebase(
                                      _passwordController.text);

                                  if (value == null || value.isEmpty) {
                                    _passError = "Please Enter a Password";
                                    return _passError;
                                  }

                                  if (_passwordController.text !=
                                      firebasePass) {
                                    _passError = "The Password is Incorrect";
                                    return _passError;
                                  }

                                  setState(() {
                                    _passError = null;
                                  });

                                  return _emailError;
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
                                    child: const Text("Forgot Password?",
                                        style: TextStyle(color: Colors.grey)),
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
                    onPressed: () {
                      if (_key.currentState!.validate()) {
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
