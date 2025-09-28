import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    this.validator,
    this.onChanged,
    this.obscureText,
    super.key,
    required this.hintText,
    this.controller,
  });

  final String hintText;
  final void Function(String)? onChanged;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      cursorColor: Colors.black,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: const TextStyle(color: Colors.grey),
        border: const UnderlineInputBorder(),
        
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey), 
        ),
        // suffixIcon: Icon(
        //   Icons.check,
        //   color: Colors.green,
        // ),
      ),
    );
  }
}
