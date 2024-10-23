import 'dart:developer';

import 'package:booklyapp/features/home/presentaion/views/home_page.dart';

import 'package:booklyapp/features/presentation/view_model/cubits/auth_cubit.dart';
import 'package:booklyapp/features/presentation/view_model/cubits/auth_state.dart';
import 'package:booklyapp/features/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool scuredText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            height: 10,
            // width: 100,
            color: const Color.fromARGB(193, 255, 128, 0),
            alignment: Alignment.center,
          ),
        ),
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              const CircularProgressIndicator();
              log("LOading***********");
            } else if (state is LoginSucceed) {
              log("Succeeding***********");

              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return const HomePage();
              }));
            } else if (state is LoginFailed) {
              showTopSnackBar(
                Overlay.of(context),
                const CustomSnackBar.error(
                  message:
                      "Something went wrong. Please check your credentials and try again",
                ),
              );
              log("Failed************");
            }
          },
          builder: (context, state) {
            return const LoginViewBody();
          },
        ));
  }
}
