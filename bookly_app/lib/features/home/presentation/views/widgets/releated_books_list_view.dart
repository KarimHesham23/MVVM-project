import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_image.dart';
import 'package:bookly_app/features/home/presentation/view_models/releated_books_cubit/releated_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ReleatedBooksListView extends StatelessWidget {
  const ReleatedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: BlocBuilder<ReleatedBooksCubit, RelatedBooksState>(
        builder: (context, state) {
          if (state is RelatedBooksFaileur) {
            return CustomErrorWidget(errorMessage: state.errorMessage);
          } else if (state is RelatedBooksSuccess) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: () {
                        context.pushReplacementNamed(BookDetailsView.id,
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
          } else {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: CustomLoadingImage(aspectRatio: 2.7 / 4),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
