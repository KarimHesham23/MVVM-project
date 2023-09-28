import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'all_books_state.dart';

class AllBooksCubit extends Cubit<AllBooksState> {
  AllBooksCubit(this.homeRepo) : super(AllBooksInitial());
  final HomeRepo homeRepo;
  String? category;

  Future<void> getAllBooks(String subject) async {
    category = subject;
    emit(AllBooksLoading());
    var reslut = await homeRepo.fetchAllBoooks(subject);
    reslut.fold(
      (failure) => emit(AllBooksFailure(errorMessage: failure.errorMessages)),
      (books) => emit(AllBooksSuccess(books: books)),
    );
  }
}
