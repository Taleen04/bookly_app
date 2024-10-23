import 'package:bloc/bloc.dart';
import 'package:booklyapp/features/home/data/model/BookModel/mm.dart';
import 'package:booklyapp/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewestBooks();
    result.fold((failures) {
      emit(NewestBooksFailuer(failures.errorMessage));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
