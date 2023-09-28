import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/categories/data/models/category_model.dart';
import 'package:bookly_app/features/home/presentation/view_models/all_books_cubit/all_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({super.key, required this.categoryDetails});
  final CategoryModel categoryDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<AllBooksCubit>(context)
              .getAllBooks(categoryDetails.categoryName);
          BlocProvider.of<NewestBooksCubit>(context)
              .getNewestBooks(categoryDetails.categoryName);
          context.pushNamed(HomeView.id);
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(categoryDetails.categoryImage),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Text(
              categoryDetails.categoryName,
              style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
