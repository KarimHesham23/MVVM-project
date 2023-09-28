import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  SearchBookCubit(this.searchRepo) : super(SearchBookInitial());
  final SearchRepo searchRepo;
  getSearchedBook({required String bookNamed}) async {
    emit(SearchBookLoading());
    var result = await searchRepo.fetchSearchedBook(bookName: bookNamed);
    result.fold(
      (failure) => emit(
        SearchBookFailure(errorMessage: failure.errorMessages),
      ),
      (success) => emit(
        SearchBookSuccess(books: success),
      ),
    );
  }
}
