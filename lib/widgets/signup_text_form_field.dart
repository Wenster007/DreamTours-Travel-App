import 'package:flutter/material.dart';

class SignUpTextFormField extends StatelessWidget {
  const SignUpTextFormField({Key? key, required this.title, required this.icon, required this.validatorFun})
      : super(key: key);

  final String title;
  final IconData icon;
  final String? Function(String value) validatorFun;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF000000),
            fontSize: 16,
          ),
        ),
        suffixIcon: Icon(
          icon,
          color: const Color(0xFF463EC9),
        ),
      ),
      validator: (value) {
        validatorFun(value!);
      },
    );
  }
}
