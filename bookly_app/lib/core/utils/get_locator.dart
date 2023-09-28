import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/categories/data/repo/category_repo_implem.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implem.dart';
import 'package:bookly_app/features/search/data/repo/search_repo_implem.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImplem>(
    HomeRepoImplem(
      apiService: getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<CategoryRepoImplem>(CategoryRepoImplem());
  getIt.registerSingleton<SearchRepoImplem>(
    SearchRepoImplem(
      apiService: getIt.get<ApiService>(),
    ),
  );
}
