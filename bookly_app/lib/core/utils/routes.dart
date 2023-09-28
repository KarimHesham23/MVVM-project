import 'package:bookly_app/features/categories/presentation/views/categories_view.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:bookly_app/features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoute {
  static const String kHomeView = "/HomeView";
  static const String kBookDetailsView = "/Book_Details_View";
  static const String kSearchView = "/Search_View";
  static const String kCategoriesView = "/Categories_View";
  static final router = GoRouter(
    routes: [
      GoRoute(
        name: SplashViewBody.id,
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        name: CategoriesView.id,
        path: kCategoriesView,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return customAnimationRoute(state, const CategoriesView(), 1600);
        },
      ),
      GoRoute(
        name: HomeView.id,
        path: kHomeView,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return customAnimationRoute(state, const HomeView(), 600);
        },
      ),
      GoRoute(
        name: BookDetailsView.id,
        path: kBookDetailsView,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return customAnimationRoute(
              state,
              BookDetailsView(
                book: state.extra as BookModel,
              ),
              600);
        },
      ),
      GoRoute(
        name: SearchView.id,
        path: kSearchView,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return customAnimationRoute(state, const SearchView(), 600);
        },
      ),
    ],
  );

  static CustomTransitionPage<void> customAnimationRoute(
      GoRouterState state, child, int duration) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionDuration: Duration(milliseconds: duration),
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
          child: child,
        );
      },
    );
  }
}
