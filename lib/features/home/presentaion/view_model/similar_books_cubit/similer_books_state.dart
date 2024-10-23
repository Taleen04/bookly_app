import 'package:equatable/equatable.dart';

import '../../../data/model/BookModel/mm.dart';

sealed class SimilerBooksState extends Equatable {
  const SimilerBooksState();

  @override
  List<Object> get props => [];
}

final class SimilerBooksInitial extends SimilerBooksState {}

final class SimilerBooksSuccess extends SimilerBooksState {
  final List<BookModel> books;

  const SimilerBooksSuccess(this.books);
}

final class SimilerBooksFailuer extends SimilerBooksState {
  final String errorMessage;

  const SimilerBooksFailuer(this.errorMessage);
}

final class SimilerBooksLoading extends SimilerBooksState {}
