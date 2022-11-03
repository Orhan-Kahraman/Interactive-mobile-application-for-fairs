import 'package:flutter/material.dart';
import 'package:flutter_tutorial_1_ecommerce_app/features/auth/screens/auth_screen.dart';

class ScreensChangeAnimation {
  static late final AnimationController topTextcont;
  static late final Animation<Offset> topTextAnimation;

  static late final AnimationController bottomTextcont;
  static late final Animation<Offset> bottomTextAnimation;

  static var isPlaying = false;
  static var currentScreen = ScreenInfo.createAccount;

  static final List<AnimationController> createAccCont = [];
  static final List<Animation<Offset>> createAccAnimations = [];

  static final List<AnimationController> loginCont = [];
  static final List<Animation<Offset>> loginAnimations = [];

  static Animation<Offset> _createAnimation(
      {required Offset begin,
      required Offset end,
      required AnimationController parent}) {
    return Tween(begin: begin, end: end)
        .animate(CurvedAnimation(parent: parent, curve: Curves.easeInOut));
  }

  static void initialize({
    required TickerProvider vsync,
    required int createAccItems,
    required int loginItems,
  }) {
    topTextcont = AnimationController(
        vsync: vsync, duration: const Duration(milliseconds: 300));

    topTextAnimation = _createAnimation(
      begin: Offset.zero,
      end: const Offset(0, -2),
      parent: topTextcont,
    );

    bottomTextcont = AnimationController(
        vsync: vsync, duration: const Duration(milliseconds: 300));

    bottomTextAnimation = _createAnimation(
      begin: Offset.zero,
      end: const Offset(0, 2.7),
      parent: bottomTextcont,
    );

    for (var i = 0; i < createAccItems; i++) {
      createAccCont.add(
        AnimationController(
          vsync: vsync,
          duration: const Duration(milliseconds: 200),
        ),
      );
      createAccAnimations.add(_createAnimation(
          begin: Offset.zero,
          end: const Offset(-1, 0),
          parent: createAccCont[i]));
    }

    for (var i = 0; i < loginItems; i++) {
      loginCont.add(
        AnimationController(
          vsync: vsync,
          duration: const Duration(milliseconds: 200),
        ),
      );
      loginAnimations.add(_createAnimation(
          begin: const Offset(1, 0), end: Offset.zero, parent: loginCont[i]));
    }
  }

  static void dispose() {
    for (final contoller in [
      topTextcont,
      bottomTextcont,
      ...createAccCont,
      ...loginCont,
    ]) {
      contoller.dispose();
    }
  }

  static Future<void> forward() async {
    isPlaying = true;

    topTextcont.forward();
    await bottomTextcont.forward();

    for (final controller in [
      ...createAccCont,
      ...loginCont,
    ]) {
      controller.forward();
      await Future.delayed(const Duration(milliseconds: 100));
    }

    bottomTextcont.reverse();
    await topTextcont.reverse();

    isPlaying = false;
  }

  static Future<void> reverse() async {
    isPlaying = true;

    topTextcont.forward();
    await bottomTextcont.forward();

    for (final controller in [
      ...loginCont.reversed,
      ...createAccCont.reversed,
    ]) {
      controller.reverse();
      await Future.delayed(const Duration(milliseconds: 100));
    }

    bottomTextcont.reverse();
    await topTextcont.reverse();

    isPlaying = false;
  }
}
