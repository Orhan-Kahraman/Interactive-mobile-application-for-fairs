import 'package:flutter/material.dart';
import 'package:flutter_tutorial_1_ecommerce_app/features/auth/animations/screens_change.dart';
import 'package:flutter_tutorial_1_ecommerce_app/features/auth/widgets/toptext.dart';
import 'package:flutter_tutorial_1_ecommerce_app/features/auth/widgets/login_button.dart';
import 'package:flutter_tutorial_1_ecommerce_app/helpers/helper_function.dart';
import 'package:ionicons/ionicons.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  final _createNameController = TextEditingController();
  final _createEmaiController = TextEditingController();
  final _createPasswordController = TextEditingController();

  final _loginEmailController = TextEditingController();
  final _loginPasswordController = TextEditingController();

  Future<void> loginFunc() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _loginEmailController.text.trim(),
      password: _loginPasswordController.text.trim(),
    );
  }

  @override
  void initState() {
    createAccContent = [
      InputField(
          hint: "Name",
          iconData: Ionicons.person_outline,
          inputType: TextInputType.name,
          textController: _createNameController),
      InputField(
          hint: "E-mail",
          iconData: Ionicons.mail_outline,
          inputType: TextInputType.emailAddress,
          textController: _createEmaiController),
      InputField(
          hint: "Password",
          iconData: Ionicons.lock_closed_outline,
          inputType: TextInputType.visiblePassword,
          isPassword: true,
          textController: _createPasswordController),
      const LoginButton(title: "Sign up", loginfunc: null),
    ];

    loginContent = [
      InputField(
          hint: "E-mail",
          iconData: Ionicons.mail_outline,
          inputType: TextInputType.emailAddress,
          textController: _loginEmailController),
      InputField(
        hint: "Password",
        iconData: Ionicons.lock_closed_outline,
        inputType: TextInputType.visiblePassword,
        isPassword: true,
        textController: _loginPasswordController,
      ),
      LoginButton(
        title: "Log in",
        loginfunc: loginFunc,
      ),
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

    _createEmaiController.dispose();
    _createNameController.dispose();
    _createPasswordController.dispose();
    _loginEmailController.dispose();
    _loginPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: Scaffold(
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
      ),
    );
  }
}

enum ScreenInfo {
  createAccount,
  welcomeback,
}
