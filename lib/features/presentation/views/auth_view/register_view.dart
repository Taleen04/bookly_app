import 'dart:developer';

import 'package:booklyapp/features/presentation/view_model/cubits/auth_cubit.dart';
import 'package:booklyapp/features/presentation/view_model/cubits/auth_state.dart';
import 'package:booklyapp/features/presentation/views/auth_view/login_view.dart';
import 'package:booklyapp/features/presentation/views/widgets/register_view_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
        body: BlocConsumer<RegisterCupit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterLoading) {
              const CircularProgressIndicator();
              log("LOading***********");
            } else if (state is RegisterSucceed) {
              log("Succeeding***********");

              FirebaseAuth.instance.currentUser!.sendEmailVerification();
              showTopSnackBar(
                Overlay.of(context),
                const CustomSnackBar.info(
                  message: "Go to your email , to verify your account",
                ),
              );

              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return const LoginPage();
              }));
              //  Navigator.of(context).push(MaterialPageRoute(builder: (_){return }))
            } else if (state is RegisterFailed) {
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
            return const RegisterViewBody();
          },
        ));
  }
}
