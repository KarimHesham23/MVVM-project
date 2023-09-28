import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplem extends SearchRepo {
  final ApiService apiService;

  SearchRepoImplem({required this.apiService});

  @override
  Future<Either<Failures, List<BookModel>>> fetchSearchedBook(
      {required String bookName}) async {
    try {
      var data = await apiService.get(
          endpoint: "volumes?Filtering=free-ebooks&q=intitle:$bookName");
      List<BookModel> books = [];
      if (data["items"] != null) {
        for (Map<String, dynamic> element in data["items"]) {
          if (element["volumeInfo"]["imageLinks"] == null) {
            continue;
          } else {
            books.add(BookModel.fromJson(element));
          }
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
