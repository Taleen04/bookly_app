import 'dart:developer';

import 'package:booklyapp/core/widgets/custom_errror_widget.dart';
import 'package:booklyapp/features/home/presentaion/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:booklyapp/features/home/presentaion/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key, this.hight});
  final double? hight;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    child: CustomBookImage(
                      imageurl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                              "",
                    ),
                  );
                }),
          );
        } else if (state is FeaturedBooksFailuer) {
          log(state.errorMessage);
          return CustomErrrorWidget(errorMessage: state.errorMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
