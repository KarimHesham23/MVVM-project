import 'package:bookly_app/core/utils/get_locator.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implem.dart';
import 'package:bookly_app/features/home/presentation/view_models/all_books_cubit/all_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_models/releated_books_cubit/releated_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});
  static String id = "Book Details";
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReleatedBooksCubit(getIt.get<HomeRepoImplem>())
        ..getReleatedBooks(book.volumeInfo.categories?[0] ??
            BlocProvider.of<AllBooksCubit>(context).category),
      child: Scaffold(
        body: BookDetailsViewBody(
          book: book,
        ),
      ),
    );
  }
}
