import 'package:ca_flutter_test/core/animations/custom_animations.dart';
import 'package:ca_flutter_test/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController =
      AnimationController(vsync: this, duration: Duration(milliseconds: 900))
        ..forward();

  late final _offsetAnimationLTR =
      CustomAnimations.ltrTransition(animationController);

  late final _offsetAnimationRTL =
      CustomAnimations.rtlTransition(animationController);

  @override
  void initState() {
    super.initState();
    animationController.addStatusListener(statusListener);
  }

  void statusListener(status) {
    if (status == AnimationStatus.completed) {
      Modular.to.pushReplacementNamed(Routes.login);
    }
  }

  @override
  void dispose() {
    animationController.removeStatusListener(statusListener);
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _offsetAnimationLTR,
              child: Text(
                'Blog',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            SlideTransition(
              position: _offsetAnimationRTL,
              child: Text(
                'App',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            )
          ],
        ),
      ),
    );
  }
}
