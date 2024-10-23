import 'package:booklyapp/core/widgets/custom_errror_widget.dart';
import 'package:booklyapp/features/home/presentaion/view_model/newest_books_cubit/newest_books_cubit.dart';
import 'package:booklyapp/features/home/presentaion/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
        builder: (context, state) {
      if (state is NewestBooksSuccess) {
        return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BestSellerListViewItem(
                    bookModel: state.books[index],
                    // title: state.books[index].volumeInfo.title,
                    //imageurl:
                    //  state.books[index].volumeInfo.imageLinks?.thumbnail ??
                    //     "",
                  ));
            });
      } else if (state is NewestBooksFailuer) {
        return CustomErrrorWidget(errorMessage: state.errorMessage);
      } else {
        return const CircularProgressIndicator();
      }
    });
  }
}
