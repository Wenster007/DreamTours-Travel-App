import 'package:dreamtour/widgets/signup_text_form_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);


  String? _nameValidator(String value) {
    if (value.isEmpty || value.trim().length <=1){
      return "Must be between 1 and 50 characters";
    }
    return null;
  }
  
  String? _emailValidator(String value) {
    if (value.isEmpty || !value.contains("@") ||value.trim().length <=1){
      return "Incorrect Email Format";
    }
    return null;
  }

  String? _passWordValidator(String value) {
    if (value.isEmpty || value.trim().length <=8 ){
      return "Password must be atleast 8 characters";
    }
    return null;
  }

  String? _confirmPassWordValidator(String value) {
    if (value.isEmpty || value.trim().length <=8 ){
      return "Password must be atleast 8 characters";
    }
    return null;
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
                    child: Container(
                      height: height*0.47,
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
                            Expanded(
                              child: SignUpTextFormField(
                                  title: "Name", icon: Icons.person, validatorFun: _nameValidator,),
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            Expanded(
                              child: SignUpTextFormField(
                                  title: "Email", icon: Icons.email, validatorFun: _emailValidator,),
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            Expanded(
                              child: SignUpTextFormField(
                                  title: "Password", icon: Icons.key, validatorFun: _passWordValidator),
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            Expanded(
                              child: SignUpTextFormField(
                                  title: "Confirm Password", icon: Icons.key, validatorFun: _confirmPassWordValidator),
                            ),
                            SizedBox(
                              height: height * 0.08,
                            ),
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
              left: width * 0.22,
              child: MaterialButton(
                onPressed: () {
                  _key.currentState!.validate();
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
            )
          ],
        ),
      ),
    );
  }
}
