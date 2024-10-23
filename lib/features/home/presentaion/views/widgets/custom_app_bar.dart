import 'package:booklyapp/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Image.asset(
            AssetsData.logo,
            height: 140,
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                GoRouter.of(context).push("/SearchView");
              },
              icon: const Icon(
                color: Colors.white,
                FontAwesomeIcons.magnifyingGlass,
                size: 30,
              ))
        ],
      ),
    );
  }
}
