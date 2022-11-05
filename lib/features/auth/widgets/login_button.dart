import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.title, required this.loginfunc});
  final String title;
  final void Function()? loginfunc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            elevation: 8,
            shadowColor: Colors.black87,
            padding: const EdgeInsets.symmetric(vertical: 10)),
        onPressed: loginfunc,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Colors.white, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
