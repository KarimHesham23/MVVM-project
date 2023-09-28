part of 'releated_books_cubit.dart';

sealed class RelatedBooksState extends Equatable {
  const RelatedBooksState();

  @override
  List<Object> get props => [];
}

final class RelatedBooksInitial extends RelatedBooksState {}

final class RelatedBooksLoading extends RelatedBooksState {}

final class RelatedBooksFaileur extends RelatedBooksState {
  final String errorMessage;

  const RelatedBooksFaileur({required this.errorMessage});
}

final class RelatedBooksSuccess extends RelatedBooksState {
  final List<BookModel> books;

  const RelatedBooksSuccess({required this.books});
}
