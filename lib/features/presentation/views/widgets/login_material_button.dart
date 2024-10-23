// import 'package:booklyapp/features/presentation/view_model/cubits/auth_cubit.dart';
// import 'package:booklyapp/features/presentation/views/widgets/login_view_body.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';

// class LoginMaterialButton extends StatelessWidget {
//   const LoginMaterialButton({
//     super.key,
//     required this.formState,
//   });

//   final GlobalKey<FormState> formState;
//   CollectionReference users = FirebaseFirestore.instance.collection('users');
//   addUsers() async {
//     await users.add({
//        "email":emaillController.text,
//        "password":passsController.text

//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         color: const Color.fromARGB(193, 255, 128, 0),
//         height: 65,
//         minWidth: double.infinity,
//         onPressed: () {
//           if (formState.currentState!.validate()) {
//             BlocProvider.of<LoginCubit>(context).loginUser(
//                 email: emaillController.text, password: passsController.text);
//           }

//         },
//         child: const Text("Log In",
//             style: TextStyle(color: Colors.white, fontSize: 20)));
//   }
// }
