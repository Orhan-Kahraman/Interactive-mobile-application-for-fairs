import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Giriş Yapıldı as ${user?.email}"),
            OutlinedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: const Text("Çıkış yap"))
          ],
        ),
      ),
    );
    ;
  }
}
