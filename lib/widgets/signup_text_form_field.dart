import 'package:flutter/material.dart';

class SignUpTextFormField extends StatelessWidget {
  const SignUpTextFormField({Key? key, required this.title, required this.icon}) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(title, style: const TextStyle(color: Color(0xFF000000),fontSize: 16 )),
        suffixIcon: Icon(icon, color: const Color(0xFF463EC9)),
      ),
    );
  }
}
