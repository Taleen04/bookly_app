//import 'package:booklyapp/constant.dart';
import 'package:booklyapp/core/utils/assets.dart';
//import 'package:booklyapp/features/home/presentaion/views/home_page.dart';
//import 'package:booklyapp/features/presentation/views/widgets/welcome_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation; //object

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        SlideTransition(
          position: slidingAnimation,
          child: Text("Read Free Books",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 20)),
        )
      ],
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: const Offset(0, 0))
            .animate(animationController);
    animationController.forward();
    slidingAnimation.addListener(
      () {
        setState(() {});
      },
    );
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        //   Get.to(const WelcomeViewBody(),
        //       transition: Transition.fade, duration: kTransitionDuration);
        goToHome();
      },
    );
  }

  void goToHome() {
    GoRouter.of(context).push("/welcomeView");
  }
}
