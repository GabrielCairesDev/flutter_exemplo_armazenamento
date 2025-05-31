import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;

  const TextFormFieldWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: 'Digite algo...',
        hintStyle: TextStyle(color: Colors.white70),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }
}
