part of 'all_books_cubit.dart';

sealed class AllBooksState extends Equatable {
  const AllBooksState();

  @override
  List<Object> get props => [];
}

final class AllBooksInitial extends AllBooksState {}

final class AllBooksFailure extends AllBooksState {
  final String errorMessage;

  const AllBooksFailure({required this.errorMessage});
}

final class AllBooksLoading extends AllBooksState {}

final class AllBooksSuccess extends AllBooksState {
  final List<BookModel> books;

  const AllBooksSuccess({required this.books});
}
