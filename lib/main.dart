import 'package:blood_donors_app/screens/addPage.dart';
import 'package:blood_donors_app/screens/homePage.dart';
import 'package:blood_donors_app/screens/splashPage.dart';
import 'package:blood_donors_app/screens/updatePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'splashPage': (context) => const SplashScreen(),
          'homePage': (context) => const HomePage(),
          'addPage': (context) => const AddUser(),
          'updatePage': (context) => const UpdatePage()
        },
        initialRoute: 'splashPage');
  }
}
