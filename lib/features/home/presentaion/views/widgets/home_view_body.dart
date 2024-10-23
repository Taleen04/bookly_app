import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/features/home/presentaion/views/widgets/best_seller_list_view.dart';

import 'package:booklyapp/features/home/presentaion/views/widgets/custom_app_bar.dart';

import 'package:booklyapp/features/home/presentaion/views/widgets/featured_books_list_view.dart';

import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      //nested scroll
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              FeaturedBooksListView(),
              SizedBox(
                height: 47,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Best Sellers",
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //BestSellerListView()
            ],
          ),
        ),
        SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: BestSellerListView(),
        ))
      ],
    );
    // return const Padding(
    //   padding: EdgeInsets.symmetric(horizontal: 30),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       CustomAppBar(),
    //       FeaturedBooksListView(),
    //       SizedBox(
    //         height: 47,
    //       ),
    //       Text(
    //         "Best Sellers",
    //         style: Styles.textStyle18,
    //       ),
    //       SizedBox(
    //         height: 20,
    //       ),
    //       BestSellerListView()
    //     ],
    //   ),
    // );
  }
}
