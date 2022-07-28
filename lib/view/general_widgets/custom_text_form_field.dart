import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final Widget? icon;
  final bool? isReadOnly;
  const CustomTextFormField({
    Key? key,
    required this.title,
    this.controller,
    this.icon,
    required this.textInputType,
    this.isReadOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        readOnly: isReadOnly!,
        cursorColor: Colors.grey,
        style: TextStyle(color: Colors.grey.shade600),
        decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green.shade400,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          hintText: title,
          suffixIcon: icon,
          hintStyle: const TextStyle(
            color: Colors.grey,
            letterSpacing: 0.6,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
