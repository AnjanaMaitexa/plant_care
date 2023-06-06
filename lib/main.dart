import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:plant_care/wel.dart';




Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WelcomePage(),
  ));
}

