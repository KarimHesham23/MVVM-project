import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CategoriesViewAppBar extends StatelessWidget {
  const CategoriesViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetsData.logo,
            height: 28,
          ),
        ],
      ),
    );
  }
}
