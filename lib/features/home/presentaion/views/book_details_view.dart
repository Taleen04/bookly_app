import 'package:booklyapp/features/home/data/model/BookModel/mm.dart';
import 'package:booklyapp/features/home/presentaion/view_model/similar_books_cubit/similer_books_cubit.dart';
import 'package:booklyapp/features/home/presentaion/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilerBooksCubit>(context)
        .similerBooks(category: widget.bookModel.volumeInfo.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BookDetailsViewBody(
        bookModel: widget.bookModel,
      )),
    );
  }
}
