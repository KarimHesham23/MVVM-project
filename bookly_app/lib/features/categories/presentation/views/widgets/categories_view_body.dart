import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/categories/presentation/view_models/category_data_cubit/category_data_cubit.dart';
import 'package:bookly_app/features/categories/presentation/views/widgets/categories_item.dart';
import 'package:bookly_app/features/categories/presentation/views/widgets/categories_view_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CategoriesViewAppBar(),
          const SizedBox(
            height: 18,
          ),
          Text(
            "Categories",
            style: Styles.textStyle18.copyWith(
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
              child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            itemCount:
                BlocProvider.of<CategoryDataCubit>(context).categories.length,
            itemBuilder: (context, index) {
              return CategoriesItem(
                categoryDetails: BlocProvider.of<CategoryDataCubit>(context)
                    .categories[index],
              );
            },
          )),
        ],
      ),
    );
  }
}
