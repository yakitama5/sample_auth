import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sample_auth/app/app.dart';
import 'package:sample_auth/firebase_options.dart';

void main() async {
  // Firebase Initialize
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Firebase Instance
  GetIt.I.registerSingleton(FirebaseAuth.instance);

  runApp(const App());
}
