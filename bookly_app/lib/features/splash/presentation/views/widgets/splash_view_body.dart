import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/categories/presentation/views/categories_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});
  static String id = "splash View";

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> transformAnimation;
  @override
  void initState() {
    super.initState();
    initTransformAnimation();
    naviagteToHome();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: transformAnimation,
      builder: (context, child) => Transform.scale(
        scale: transformAnimation.value,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AssetsData.logo),
            const SizedBox(
              height: 3,
            ),
            const Text(
              "Read Free Books",
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void naviagteToHome() {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        // Get.to(
        //   () => const HomeView(),
        //   duration: kTransationDuration,
        //   transition: Transition.fade,
        // );
        context.goNamed(CategoriesView.id);
      },
    );
  }

  void initTransformAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    transformAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.linear);
    animationController.forward();
    // slidingAnimationText =
    //     Tween<Offset>(begin: const Offset(4, 0), end: Offset.zero)
    //         .animate(animationController);
  }
}
