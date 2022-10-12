import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:life_view/core/app/app.dart';
import 'package:life_view/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const App());
}
