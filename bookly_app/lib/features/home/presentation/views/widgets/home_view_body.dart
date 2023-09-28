import 'package:bookly_app/features/home/presentation/views/widgets/custom_home_view_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/home_body_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHomeViewAppBar(),
        HomeBodyListView(),
      ],
    );
  }
}
