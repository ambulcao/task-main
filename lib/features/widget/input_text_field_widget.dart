import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    this.obscureText,
    this.validator
  });

  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final bool? obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Container(
        child: TextFormField(
          validator: validator,
          controller: controller,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(138, 144, 162, 1),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}