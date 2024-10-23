import 'dart:developer';

import 'package:booklyapp/features/presentation/view_model/cubits/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginUser(
      {required String email, required String password, context}) async {
    emit(LoginLoading());
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user!.emailVerified) {
        emit(LoginSucceed());
      } else {
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
            message: "Something went wrong. Please verify your email",
          ),
        );
        log("Please verify your email");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
        emit(LoginFailed());
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
        emit(LoginFailed());
      } else if (e.code == "wrong-email") {
        log('Wrong email provided for that user.');
        emit(LoginFailed());
      }
    }
  }
}

class RegisterCupit extends Cubit<RegisterState> {
  RegisterCupit() : super(RegisterInitial());

  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      emit(RegisterSucceed());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
        emit(RegisterFailed());
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
        emit(RegisterFailed());
      }
    }
  }
}
