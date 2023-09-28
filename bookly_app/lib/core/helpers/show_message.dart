import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

void showMessage(BuildContext context, {required message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: Styles.textStyle14.copyWith(
          color: Colors.white,
        ),
      ),
      duration: const Duration(seconds: 4), // Adjust the duration as needed
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.grey[900],
      action: SnackBarAction(
        label: 'Close',
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}
