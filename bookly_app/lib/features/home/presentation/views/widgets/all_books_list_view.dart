import 'package:bookly_app/core/helpers/show_message.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_image.dart';
import 'package:bookly_app/features/home/presentation/view_models/all_books_cubit/all_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AllBooksListView extends StatelessWidget {
  const AllBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllBooksCubit, AllBooksState>(
      listener: (context, state) {
        if (state is AllBooksFailure) {
          showMessage(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is AllBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed(BookDetailsView.id,
                          extra: state.books[index]);
                    },
                    child: CustomBookImage(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks.thumbnail,
                      aspectRatio: 2.7 / 4,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is AllBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: CustomLoadingImage(aspectRatio: 2.7 / 4));
              },
            ),
          );
        }
      },
    );
  }
}
