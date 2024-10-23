import 'package:bloc/bloc.dart';
import 'package:booklyapp/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/BookModel/mm.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchFeaturdBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (failures) {
        emit(FeaturedBooksFailuer(failures.errorMessage));
        print("*************************************************");
      },
      (books) {
        emit(FeaturedBooksSuccess(books));
      },
    );
  }
}
