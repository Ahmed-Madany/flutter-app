import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.lableText,
    // ignore: non_constant_identifier_names
    required this.PreFixIcon,
    this.isHidden = false,
    this.suffixIcon,
    this.validator,
    this.controller,
  });
  final String lableText;
  // ignore: non_constant_identifier_names
  final Widget PreFixIcon;
  final bool isHidden;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: lableText,
          border: OutlineInputBorder(),
          prefixIcon: PreFixIcon,
          suffixIcon: suffixIcon,
        ),
        obscureText: isHidden,
        validator: validator,
        controller: controller,

      ),
    );
  }
}
