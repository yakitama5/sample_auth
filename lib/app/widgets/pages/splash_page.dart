import 'package:flutter/material.dart';
import 'package:sample_auth/app/router/app_pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppPages.splash.toTitle)),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
