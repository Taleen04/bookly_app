import 'dart:developer';
import 'package:booklyapp/core/api_service.dart';
import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/features/home/data/repos/home_repo_impl.dart';
import 'package:booklyapp/features/home/presentaion/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:booklyapp/features/home/presentaion/view_model/newest_books_cubit/newest_books_cubit.dart';
import 'package:booklyapp/features/presentation/view_model/cubits/auth_cubit.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      log('User is currently signed out!');
    } else {
      log('User is signed in!');
    }
  });
  runApp(BooklyApp());
}

// ignore: must_be_immutable
class BooklyApp extends StatelessWidget {
  BooklyApp({super.key});
  ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.black,
      brightness: Brightness.dark,
      surface: const Color.fromRGBO(158, 158, 158, 0.033));

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCupit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(HomeRepoImpl(ApiService(Dio()))
                  // getIt.get<HomeRepoImpl>(),
                  )
                ..fetchFeaturdBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(HomeRepoImpl(ApiService(Dio())))
            ..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
          // routerConfig: _router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData().copyWith(
            appBarTheme:
                const AppBarTheme(color: Color.fromRGBO(158, 158, 158, 0.063)),
            colorScheme: colorScheme,
            scaffoldBackgroundColor: const Color.fromRGBO(158, 158, 158, 0.063),
            textTheme: GoogleFonts.gupterTextTheme().copyWith(
              titleSmall: GoogleFonts.gabarito()
                  .copyWith(color: const Color(0xD19E9E9E), fontSize: 18),
              titleMedium: GoogleFonts.gabarito().copyWith(
                  color: const Color.fromARGB(193, 255, 128, 0),
                  fontSize: 33,
                  fontWeight: FontWeight.bold),
              titleLarge: GoogleFonts.gupter().copyWith(
                  color: Colors.white,
                  fontSize: 33,
                  fontWeight: FontWeight.bold),
            ),
          ),
          // home: HomePage()
          routerConfig: AppRouter.router //const SplashView()
          // (FirebaseAuth.instance.currentUser != null &&
          //         FirebaseAuth.instance.currentUser!.emailVerified)
          //     ?  const HomePage()
          //     : const SplashViewBody(),
          ),
    );
  }
}
