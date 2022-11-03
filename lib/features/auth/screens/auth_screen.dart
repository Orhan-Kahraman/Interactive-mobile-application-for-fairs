import 'package:flutter/material.dart';
import 'package:flutter_tutorial_1_ecommerce_app/features/auth/animations/screens_change.dart';
import 'package:flutter_tutorial_1_ecommerce_app/features/auth/screens/toptext.dart';
import 'package:flutter_tutorial_1_ecommerce_app/features/auth/widgets/login_button.dart';
import 'package:flutter_tutorial_1_ecommerce_app/helpers/helper_function.dart';
import 'package:ionicons/ionicons.dart';

import '../widgets/bottom_text.dart';
import '../widgets/forgot_password.dart';
import '../widgets/input_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);
  static const String routeName = '/auth_screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  late final List<Widget> createAccContent;
  late final List<Widget> loginContent;

  @override
  void initState() {
    createAccContent = [
      const InputField(hint: "Name", iconData: Ionicons.person_outline),
      const InputField(hint: "E-mail", iconData: Ionicons.mail_outline),
      const InputField(
          hint: "Password", iconData: Ionicons.lock_closed_outline),
      const LoginButton(title: "Sign up"),
    ];

    loginContent = [
      const InputField(hint: "E-mail", iconData: Ionicons.mail_outline),
      const InputField(
        hint: "Password",
        iconData: Ionicons.lock_closed_outline,
      ),
      const LoginButton(title: "Log in"),
      const ForgotPassword(),
    ];

    ScreensChangeAnimation.initialize(
      vsync: this,
      createAccItems: createAccContent.length,
      loginItems: loginContent.length,
    );

    for (var i = 0; i < createAccContent.length; i++) {
      createAccContent[i] = HelperFunction.wrapWithAmimated(
          animation: ScreensChangeAnimation.createAccAnimations[i],
          child: createAccContent[i]);
    }

    for (var i = 0; i < loginContent.length; i++) {
      loginContent[i] = HelperFunction.wrapWithAmimated(
          animation: ScreensChangeAnimation.loginAnimations[i],
          child: loginContent[i]);
    }
    super.initState();
  }

  @override
  void dispose() {
    ScreensChangeAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 60),
              child: TopText(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: createAccContent,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: loginContent,
                  ),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 50), child: BottomText()),
            ),
          ],
        ),
      )),
    );
  }
}

enum ScreenInfo {
  createAccount,
  welcomeback,
}
