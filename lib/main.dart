import 'package:flutter/material.dart';
import 'package:flutter_tutorial_1_ecommerce_app/features/auth/screens/auth_screen.dart';
import 'package:flutter_tutorial_1_ecommerce_app/features/auth/screens/mainview.dart';
import 'package:flutter_tutorial_1_ecommerce_app/router/router.dart';
import 'package:flutter_tutorial_1_ecommerce_app/theme/theme_light.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) => generateRoute(settings),
      title: 'Fuar App',
      theme: LightTheme().theme,
      debugShowCheckedModeBanner: false,
      home: const MainView(),
    );
  }
}
