import 'package:flutter/material.dart';
import 'package:flutter_tutorial_1_ecommerce_app/constants/global_variables.dart';
import 'package:flutter_tutorial_1_ecommerce_app/features/auth/animations/screens_change.dart';
import 'package:flutter_tutorial_1_ecommerce_app/helpers/helper_function.dart';

import '../screens/auth_screen.dart';

class BottomText extends StatefulWidget {
  const BottomText({super.key});

  @override
  State<BottomText> createState() => _BottomTextState();
}

class _BottomTextState extends State<BottomText> {
  @override
  void initState() {
    ScreensChangeAnimation.bottomTextAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HelperFunction.wrapWithAmimated(
      animation: ScreensChangeAnimation.bottomTextAnimation,
      child: GestureDetector(
        onTap: () {
          if (!ScreensChangeAnimation.isPlaying) {
            ScreensChangeAnimation.currentScreen == ScreenInfo.createAccount
                ? ScreensChangeAnimation.forward()
                : ScreensChangeAnimation.reverse();

            ScreensChangeAnimation.currentScreen = ScreenInfo
                .values[1 - ScreensChangeAnimation.currentScreen.index];
          }
        },
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: GlobalVariables.cristmasBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  children: [
                TextSpan(
                    text: ScreensChangeAnimation.currentScreen ==
                            ScreenInfo.createAccount
                        ? "Zaten bir hesabınız var mı?"
                        : "Hesabınız yokmu? "),
                TextSpan(
                    text: ScreensChangeAnimation.currentScreen ==
                            ScreenInfo.createAccount
                        ? "Oturum Açın"
                        : "Kaydolun",
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: GlobalVariables.cristmasBlue,
                        fontSize: 16))
              ])),
        ),
      ),
    );
  }
}
