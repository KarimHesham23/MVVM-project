import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplem extends HomeRepo {
  final ApiService apiService;

  HomeRepoImplem({required this.apiService});
  @override
  Future<Either<Failures, List<BookModel>>> fetchAllBoooks(
      String subject) async {
    try {
      var data = await apiService.get(
          endpoint: "volumes?Filtering=free-ebooks&q=$subject");
      List<BookModel> books = [];
      for (Map<String, dynamic> element in data["items"]) {
        if (element["volumeInfo"]["imageLinks"] == null) {
          continue;
        } else {
          books.add(BookModel.fromJson(element));
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessages: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchNewstBooks(
      String subject) async {
    try {
      var data = await apiService.get(
          endpoint:
              "volumes?Filtering=free-ebooks&q=subject:$subject&Sorting=newest");
      List<BookModel> books = [];
      for (var element in data["items"]) {
        if (element["volumeInfo"]["imageLinks"] == null) {
          continue;
        } else {
          books.add(BookModel.fromJson(element));
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessages: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchReleatedBooks(
      String subject) async {
    try {
      var data = await apiService.get(
          endpoint:
              "volumes?Filtering=free-ebooks&q=$subject&Sorting=relevance");
      List<BookModel> books = [];
      for (var element in data["items"]) {
        if (element["volumeInfo"]["imageLinks"] == null) {
          continue;
        } else {
          books.add(BookModel.fromJson(element));
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessages: e.toString()));
    }
  }
}
