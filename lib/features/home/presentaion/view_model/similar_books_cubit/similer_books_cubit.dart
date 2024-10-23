import 'package:bloc/bloc.dart';
import 'package:booklyapp/features/home/data/repos/home_repo.dart';
import 'package:booklyapp/features/home/presentaion/view_model/similar_books_cubit/similer_books_state.dart';

class SimilerBooksCubit extends Cubit<SimilerBooksState> {
  SimilerBooksCubit(this.homeRepo) : super(SimilerBooksInitial());

  final HomeRepo homeRepo;

  Future<void> similerBooks({required String category}) async {
    emit(SimilerBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold((failures) {
      emit(SimilerBooksFailuer(failures.errorMessage));
    }, (books) {
      emit(SimilerBooksSuccess(books));
    });
  }
}
