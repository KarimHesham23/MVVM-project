import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/get_locator.dart';
import 'package:bookly_app/core/utils/routes.dart';
import 'package:bookly_app/features/categories/data/repo/category_repo_implem.dart';
import 'package:bookly_app/features/categories/presentation/view_models/category_data_cubit/category_data_cubit.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implem.dart';
import 'package:bookly_app/features/home/presentation/view_models/all_books_cubit/all_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CategoryDataCubit(getIt.get<CategoryRepoImplem>())
                ..getCategories(),
        ),
        BlocProvider(
          create: (context) => AllBooksCubit(
            getIt.get<HomeRepoImplem>(),
          ),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(getIt.get<HomeRepoImplem>()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoute.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
