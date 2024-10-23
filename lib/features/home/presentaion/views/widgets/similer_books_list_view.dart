import 'package:booklyapp/core/widgets/custom_errror_widget.dart';
import 'package:booklyapp/features/home/presentaion/view_model/similar_books_cubit/similer_books_cubit.dart';
import 'package:booklyapp/features/home/presentaion/view_model/similar_books_cubit/similer_books_state.dart';
import 'package:booklyapp/features/home/presentaion/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilerBooksListView extends StatelessWidget {
  const SimilerBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilerBooksCubit, SimilerBooksState>(
      builder: (context, state) {
        if (state is SimilerBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .12,
            child: ListView.builder(
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CustomBookImage(
                        imageurl: state.books[index].volumeInfo.imageLinks
                                ?.thumbnail ??
                            ""),
                  );
                }),
          );
        } else if (state is SimilerBooksFailuer) {
          return CustomErrrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
