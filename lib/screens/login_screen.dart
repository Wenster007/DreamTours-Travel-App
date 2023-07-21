import 'dart:convert';

import 'package:dreamtour/model/users.dart';
import 'package:dreamtour/screens/main_content_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isEmailCorrect = false;
  bool isPassCorrect = false;
  final _key = GlobalKey<FormState>();
  final List<User> users = [];

  //-------------==========================================-----------------------

  void getUsersFromFirebase() async {
    final url =
        Uri.https("dummy-59b5d-default-rtdb.firebaseio.com", "users.json");

    final response = await http.get(url);
    final Map<String, dynamic> dataMap = json.decode(response.body);

    for (var item in dataMap.entries) {
      User user = User(
        item.value["user_name"],
        item.value["user_email"],
        item.value["user_password"],
      );
      users.add(user);
    }
  }

  @override
  void initState() {
    getUsersFromFirebase();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                                  if (value == null || value.isEmpty) {
                                    return "Please enter an email";
                                  }

                                  isEmailCorrect = false;

                                  for (var item in users) {
                                    if (item.email == _emailController.text) {
                                      isEmailCorrect = true;
                                    }
                                  }

                                  if (!isEmailCorrect) {
                                    return "No Email Found. Please create a new Account.";
                                  }

                                  return null;
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
                                  if (value == null || value.isEmpty) {
                                    return "Please enter a Password";
                                  }

                                  isPassCorrect = false;

                                  for (var item in users) {
                                    if (item.email == _emailController.text) {
                                      if (item.password ==
                                          _passwordController.text) {
                                        isPassCorrect = true;
                                      }
                                    }
                                  }

                                  if (!isPassCorrect) {
                                    return "Wrong Password.";
                                  }

                                  return null;
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
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const MainContentScreen(),
                        ),);
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
