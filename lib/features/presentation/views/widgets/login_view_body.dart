import 'package:booklyapp/features/presentation/view_model/cubits/auth_cubit.dart';
import 'package:booklyapp/features/presentation/views/widgets/login_form_field.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

TextEditingController emaillController = TextEditingController();
TextEditingController passsController = TextEditingController();

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  addUsers() async {
    await users.add({
      "email": emaillController.text,
      "password": passsController.text,
      "Id": FirebaseAuth.instance.currentUser!.uid
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Form(
        key: formState,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                "Login To Your \n  Account",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 23,
            ),
            Text(
                "Enter your  email & password if you forget it, then you have to do forget  password",
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(
              height: 45,
            ),
            LoginFormField(
              validator: (val) {
                if (val == "") {
                  return "Can not be empty";
                }
                return null;
              },
              controller: emaillController,
              height: height,
              width: width,
              icon: const Icon(
                Icons.email,
                color: Color.fromARGB(193, 255, 128, 0),
              ),
              text: "Email",
            ),
            const SizedBox(
              height: 45,
            ),
            LoginFormField(
              validator: (val) {
                if (val == "") {
                  return "Can not be empty";
                }
                if (val!.length <= 5) {
                  return "Password is too Short";
                }
                return null;
              },
              controller: passsController,
              height: height,
              width: width,
              icon: const Icon(
                Icons.password,
                color: Color.fromARGB(193, 255, 128, 0),
              ),
              text: "Password",
            ),
            Container(
              padding: const EdgeInsets.only(right: 20, top: 10),
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () async {
                  if (emaillController.text != "") {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: emaillController.text);
                    showTopSnackBar(
                      Overlay.of(context),
                      const CustomSnackBar.success(
                        backgroundColor: Colors.grey,
                        message: "Go to your email , to reset your password",
                      ),
                    );
                  } else {
                    showTopSnackBar(
                      Overlay.of(context),
                      const CustomSnackBar.info(
                        backgroundColor: Colors.grey,
                        message: "Put your email first !",
                      ),
                    );
                  }
                },
                child: const Text("Forget Password?",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Color.fromRGBO(255, 153, 0, 0.506),
                        fontSize: 20)),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Shimmer(
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: const Color.fromARGB(193, 255, 128, 0),
                    height: 65,
                    minWidth: double.infinity,
                    onPressed: () {
                      if (formState.currentState!.validate()) {
                        BlocProvider.of<LoginCubit>(context).loginUser(
                            email: emaillController.text,
                            password: passsController.text);
                      }
                      addUsers();
                    },
                    child: const Text("Log In",
                        style: TextStyle(color: Colors.white, fontSize: 20))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
