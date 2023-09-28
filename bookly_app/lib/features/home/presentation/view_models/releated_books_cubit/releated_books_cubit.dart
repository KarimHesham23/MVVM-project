import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'releated_books_state.dart';

class ReleatedBooksCubit extends Cubit<RelatedBooksState> {
  ReleatedBooksCubit(this.homeRepo) : super(RelatedBooksInitial());
  final HomeRepo homeRepo;

  Future<void> getReleatedBooks(String subject) async {
    emit(RelatedBooksLoading());
    var reslut = await homeRepo.fetchReleatedBooks(subject);
    reslut.fold(
      (failure) =>
          emit(RelatedBooksFaileur(errorMessage: failure.errorMessages)),
      (books) => emit(RelatedBooksSuccess(books: books)),
    );
  }
}
