import 'package:booklyapp/core/api_service.dart';
import 'package:booklyapp/features/home/data/model/BookModel/mm.dart';
import 'package:booklyapp/features/home/data/repos/home_repo_impl.dart';
import 'package:booklyapp/features/home/presentaion/view_model/similar_books_cubit/similer_books_cubit.dart';
import 'package:booklyapp/features/home/presentaion/views/book_details_view.dart';
import 'package:booklyapp/features/home/presentaion/views/home_page.dart';
import 'package:booklyapp/features/home/presentaion/views/widgets/home_view_body.dart';
import 'package:booklyapp/features/presentation/views/widgets/splash_view_body.dart';
import 'package:booklyapp/features/presentation/views/widgets/welcome_view_body.dart';
import 'package:booklyapp/features/search/presentation/views/search_view.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kSplashScreen = '/SplashViewBody';

  static final router = GoRouter(routes: [
    if (FirebaseAuth.instance.currentUser != null &&
        FirebaseAuth.instance.currentUser!.emailVerified)
      GoRoute(
        path: '/', //base
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
    GoRoute(
      path: '/splashView',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashViewBody();
      },
    ),
    GoRoute(
      path: '/welcomeView',
      builder: (BuildContext context, GoRouterState state) {
        return const WelcomeViewBody();
      },
    ),
    GoRoute(
      path: '/SearchView',
      builder: (BuildContext context, GoRouterState state) {
        return const SearchView();
      },
    ),
    GoRoute(
      path: '/BookDetailsView',
      builder: (context, state) => BlocProvider(
        create: (context) => SimilerBooksCubit(
          HomeRepoImpl(
            ApiService(
              Dio(),
            ),
          ),
        ),
        child: BookDetailsView(
          bookModel: state.extra as BookModel,
        ),
      ),
    ),
    GoRoute(
      path: '/HomeViewBody',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeViewBody();
      },
    ),
    GoRoute(
      path: kSplashScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashViewBody();
      },
    ),
  ]);
}
