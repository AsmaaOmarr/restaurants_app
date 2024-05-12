import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_assignment_1/constant.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    this.onChange,
    this.controller,
    required this.labelText,
    required this.icon,
  });
  final void Function(String)? onChange; // Change the function signature
  final TextEditingController? controller;
  final String labelText;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Constant.kMainColor,
      onChanged: onChange, // Set onChanged callback
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 18,
        ),
        fillColor: Colors.grey.shade100,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade200,
            width: 0.4,
          ),
          borderRadius: BorderRadius.circular(60),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60),
          borderSide: const BorderSide(
            color: Constant.kMainColor,
            width: 0.8,
          ),
        ),
      ),
    );
  }
}
