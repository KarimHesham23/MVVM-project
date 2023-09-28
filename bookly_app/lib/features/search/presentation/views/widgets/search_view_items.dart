import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_book_item.dart';
import 'package:bookly_app/features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_list_view_item.dart';
import 'package:bookly_app/features/search/presentation/search_Book_cubit/search_book_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/result_search_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewItems extends StatelessWidget {
  const SearchViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBookCubit, SearchBookState>(
      builder: (context, state) {
        if (state is SearchBookFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else if (state is SearchBookSuccess) {
          if (state.books.isEmpty) {
            return const CustomErrorWidget(
                errorMessage: "Sorry, this book doesn't find 😌");
          } else {
            return ListView.builder(
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: ResultSearchBookItem(
                    book: state.books[index],
                  ),
                );
              },
            );
          }
        } else if (state is SearchBookLoading) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: CustomLoadingBookItem(),
              );
            },
          );
        } else {
          return BlocProvider.of<NewestBooksCubit>(context).books != null
              ? ListView.builder(
                  itemCount:
                      BlocProvider.of<NewestBooksCubit>(context).books!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: NewestBooksListViewItem(
                        book: BlocProvider.of<NewestBooksCubit>(context)
                            .books![index],
                      ),
                    );
                  },
                )
              : CustomErrorWidget(
                  errorMessage:
                      BlocProvider.of<NewestBooksCubit>(context).errorMessage!);
        }
      },
    );
  }
}
