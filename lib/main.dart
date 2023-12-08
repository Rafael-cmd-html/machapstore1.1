import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:machapstore1/screens/cartScreen.dart';
import 'package:machapstore1/screens/detailsScreen.dart';
import 'package:machapstore1/screens/homePage.dart';
import 'package:machapstore1/screens/listProducts.dart';
import 'package:machapstore1/screens/login.dart';
import 'package:machapstore1/screens/signUp.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Machapstore',
      home: HomePage(),
    );
  }
}
