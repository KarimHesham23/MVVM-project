import 'package:flutter/material.dart';

class CustomFormTextFiled extends StatelessWidget {
  const CustomFormTextFiled(
      {super.key,
      this.onSaved,
      required this.hintText,
      required this.onPressed,
      required this.icon});
  final void Function(String?)? onSaved;
  final String hintText;
  final VoidCallback onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Enter Name of book";
        } else {
          return null;
        }
      },
      onSaved: onSaved,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: Opacity(
            opacity: 0.8,
            child: Icon(
              icon,
              size: 22,
            ),
          ),
        ),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        border: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.white,
      ),
    );
  }
}
