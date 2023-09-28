import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;
  List<BookModel>? books;
  String? errorMessage;
  Future<void> getNewestBooks(String subject) async {
    emit(NewestBooksLoading());
    var reslut = await homeRepo.fetchNewstBooks(subject);
    reslut.fold((failure) {
      errorMessage = failure.errorMessages;

      return emit(NewestBooksFailure(errorMessage: failure.errorMessages));
    }, (successBooks) {
      books = successBooks;

      return emit(NewestBooksSuccess(books: successBooks));
    });
  }
}
