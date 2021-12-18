import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        actions: const [
          Icon(Icons.settings),
          Icon(Icons.search_rounded),
        ],
      ),
      body: const Center(
        child: Text(
          'LOGIN SCREEN',
        ),
      ),
    );
  }
}
