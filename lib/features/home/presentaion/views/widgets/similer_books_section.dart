import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/features/home/presentaion/views/widgets/similer_books_list_view.dart';
import 'package:flutter/material.dart';

class SimilerBooksSection extends StatelessWidget {
  const SimilerBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "You can also like",
              style: Styles.textStyle14
                  .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
            )),
        const SizedBox(
          height: 16,
        ),
        const SimilerBooksListView(),
      ],
    );
  }
}
