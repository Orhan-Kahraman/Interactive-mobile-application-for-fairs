import 'package:flutter/material.dart';
import 'package:flutter_tutorial_1_ecommerce_app/constants/global_variables.dart';
import 'package:flutter_tutorial_1_ecommerce_app/features/auth/animations/screens_change.dart';
import 'package:flutter_tutorial_1_ecommerce_app/features/auth/screens/auth_screen.dart';
import 'package:flutter_tutorial_1_ecommerce_app/helpers/helper_function.dart';

class TopText extends StatefulWidget {
  const TopText({Key? key}) : super(key: key);

  @override
  State<TopText> createState() => _TopTextState();
}

class _TopTextState extends State<TopText> {
  @override
  void initState() {
    ScreensChangeAnimation.topTextAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HelperFunction.wrapWithAmimated(
      animation: ScreensChangeAnimation.topTextAnimation,
      child: Text(
        ScreensChangeAnimation.currentScreen == ScreenInfo.createAccount
            ? "Create\nAccount"
            : "Welcome\nBack",
        style: Theme.of(context).textTheme.headline3?.copyWith(
            fontWeight: FontWeight.w700, color: GlobalVariables.cristmasBlue),
      ),
    );
  }
}
