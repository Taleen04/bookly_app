import 'package:booklyapp/features/home/data/model/BookModel/mm.dart';
import 'package:booklyapp/features/home/presentaion/views/widgets/books_action.dart';
import 'package:booklyapp/features/home/presentaion/views/widgets/books_details_section.dart';
import 'package:booklyapp/features/home/presentaion/views/widgets/custom_book_details_app_bar.dart';
import 'package:booklyapp/features/home/presentaion/views/widgets/similer_books_section.dart';

import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                BookDetailsSection(
                  bookModel: bookModel,
                ),
                const SizedBox(
                  height: 37,
                ),
                BooksAction(
                  bookModel: bookModel,
                  category: bookModel.toString(),
                ),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                const SimilerBooksSection(),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
