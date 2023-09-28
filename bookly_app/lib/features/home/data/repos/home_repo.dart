import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookModel>>> fetchAllBoooks(String subject);
  Future<Either<Failures, List<BookModel>>> fetchNewstBooks(String subject);
  Future<Either<Failures, List<BookModel>>> fetchReleatedBooks(String subject);
}
