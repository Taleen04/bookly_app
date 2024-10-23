import 'package:booklyapp/core/errors/failures.dart';
import 'package:booklyapp/features/home/data/model/BookModel/mm.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  //produce a method only without implementation ....  What will we do ?
  Future<Either<Failures, List<BookModel>>> fetchNewestBooks();
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failures, List<BookModel>>> fetchSimilarBooks(
      {required String category}); //first method in home screen
}
