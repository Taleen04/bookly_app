import 'dart:developer';

import 'package:booklyapp/features/home/presentaion/views/home_page.dart';
import 'package:booklyapp/features/presentation/views/auth_view/login_view.dart';
import 'package:booklyapp/features/presentation/views/auth_view/register_view.dart';
import 'package:booklyapp/features/presentation/views/widgets/welcome_material_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class WelcomeViewBody extends StatefulWidget {
  const WelcomeViewBody({super.key});

  @override
  State<WelcomeViewBody> createState() => _WelcomeViewBodyState();
}

Future signInWithGoogle(context) async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  if (googleUser == null) {
    return;
  }

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Once signed in, return the UserCredential
  await FirebaseAuth.instance.signInWithCredential(credential);
  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    return const HomePage();
  }));
}

class _WelcomeViewBodyState extends State<WelcomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset(
            "lib/assets/images/bookslogo (1).png",
            width: 470,
            height: 420,
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: "Welcome to ",
                  style: Theme.of(context).textTheme.titleLarge),
              TextSpan(
                  text: "Erabook",
                  style: Theme.of(context).textTheme.titleMedium)
            ],
          ),
        ),
        Text("Let's read book with\n    our book shop",
            style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(
          height: 50,
        ),
        Shimmer(
          color: Colors.orange,
          child: WelcomeMaterialButton(
              onPressed: () {
                signInWithGoogle(context);
                log("GOOD*******************");
              },
              color:
                  const Color.fromRGBO(158, 158, 158, 0.599).withOpacity(0.4),
              textt: "Continue with Google",
              image: "lib/assets/images/google (1).png"),
        ),
        const SizedBox(
          height: 45,
        ),
        Shimmer(
          color: Colors.orange,
          child: WelcomeMaterialButton(
            color: const Color.fromARGB(193, 255, 128, 0),
            textt: "Get Started",
            image: "lib/assets/images/getstarted (1).png",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return const RegisterScreen();
                  },
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 45,
        ),
        Shimmer(
          color: Colors.orange,
          child: WelcomeMaterialButton(
            color: const Color.fromRGBO(158, 158, 158, 0.599).withOpacity(0.4),
            textt: "I Already have an Account",
            image: "lib/assets/images/haveAnAccount (1).png",
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return const LoginPage();
              }));
            },
          ),
        ),
      ],
    );
  }
}
