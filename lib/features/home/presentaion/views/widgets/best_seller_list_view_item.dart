import 'package:booklyapp/features/home/data/model/BookModel/mm.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/features/home/presentaion/views/widgets/book_rating.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({
    super.key,
    // required this.imageurl,
    // required this.title,
    required this.bookModel,
  });

  ///final String imageurl;
  // final String title;
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .go("/BookDetailsView", extra: bookModel //to send info
                );
      },
      child: SizedBox(
        height: 128,
        child: Row(
          children: [
            AspectRatio(
                aspectRatio: 2.5 / 4, //width/height
                child: CachedNetworkImage(
                  imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? "",
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error_outline),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                )),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      bookModel.volumeInfo.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    "J.K, Rowling",
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        "Free",
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      const BookRating(),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
