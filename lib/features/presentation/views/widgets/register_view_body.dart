//import 'package:booklyapp/features/presentation/views/auth_view/register_view.dart';

import 'package:booklyapp/features/presentation/view_model/cubits/auth_cubit.dart';

import 'package:booklyapp/features/presentation/views/widgets/login_form_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shimmer_animation/shimmer_animation.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

bool scuredText = true;
var verificationIdd = "";

class _RegisterViewBodyState extends State<RegisterViewBody> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
    userNameController.dispose();
  }

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  // Future phoneAuth(String phoneNo) async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //       verificationCompleted: (PhoneAuthCredential credential) {
  //         FirebaseAuth.instance.signInWithCredential(credential);
  //       },
  //       phoneNumber: phoneNo,
  //       verificationFailed: (e) {
  //         if (e.code == "invalid-phone-number") {
  //           Get.snackbar("Error", "The provided phone number is invalid");
  //         } else {
  //           Get.snackbar("Error", "Something went wrong");
  //         }
  //       },
  //       codeSent: (String verificationId, int? resendToken) {
  //         verificationIdd = verificationId;
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId) {
  //         verificationIdd = verificationId;
  //       });
  // }

  // void verifyOTP(String otp) {

  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Form(
        key: formState,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Create An Account",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    "lib/assets/images/key (1).png",
                    height: 48,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 23,
            ),
            Text(
                "Enter your username, email & password if you forget it, then you have to do forget  password",
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(
              height: 45,
            ),
            LoginFormField(
              validator: (val) {
                if (val == null) {
                  return "CANNOT BE NULL";
                }
                return null;
              },
              controller: userNameController,
              height: height,
              width: width,
              icon: const Icon(
                Icons.verified_user,
                color: Color.fromARGB(193, 255, 128, 0),
              ),
              text: "Username",
            ),
            const SizedBox(
              height: 45,
            ),
            LoginFormField(
              validator: (val) {
                if (val == null) {
                  return "CANNOT be empty";
                }
                return null;
              },
              controller: emailController,
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
                  return "Cannot be empty";
                }
                if (val!.length <= 5) {
                  return "PASSWORD is too Short";
                }
                return null;
              },
              controller: passController,
              height: height,
              width: width,
              icon: const Icon(
                Icons.password,
                color: Color.fromARGB(193, 255, 128, 0),
              ),
              text: "Password",
            ),
            const SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(
                style: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.698), fontSize: 16),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: Color.fromARGB(193, 255, 128, 0),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        scuredText = !scuredText;
                      });
                    },
                    icon: Icon(scuredText
                        ? Icons.private_connectivity
                        : Icons.security),
                  ),
                  contentPadding: const EdgeInsets.only(top: 40, left: 40),
                  constraints: BoxConstraints(
                    maxHeight: height * 0.065,
                    maxWidth: width,
                  ),
                  labelText: "Phone No",
                  labelStyle:
                      const TextStyle(color: Colors.white, fontSize: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(193, 255, 128, 0), width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(193, 255, 128, 0), width: 1.0),
                  ),
                ),
                obscureText: scuredText,
                cursorColor: const Color.fromARGB(193, 255, 128, 0),
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
                        BlocProvider.of<RegisterCupit>(context).registerUser(
                            email: emailController.text,
                            password: passController.text);
                      }
                    },
                    child: const Text("Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 20))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
