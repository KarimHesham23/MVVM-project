import 'package:bookly_app/core/utils/get_locator.dart';
import 'package:bookly_app/features/search/data/repo/search_repo_implem.dart';
import 'package:bookly_app/features/search/presentation/search_Book_cubit/search_book_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static String id = "Search View";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBookCubit(getIt.get<SearchRepoImplem>()),
      child: const Scaffold(
        body: SafeArea(
          child: SearchViewBody(),
        ),
      ),
    );
  }
}
