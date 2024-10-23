import 'dart:developer';

import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/features/home/presentaion/views/widgets/home_view_body.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        //await FirebaseAuth.instance.signOut();
        GoRouter.of(context).push(AppRouter.kSplashScreen);
        log("********8");
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (_) {
        //       return const SplashViewBody();
        //     },
        //   ),
        // );
      }),
      body: const HomeViewBody(),
    );
  }
}
