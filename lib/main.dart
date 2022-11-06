import 'dart:ui';
import 'package:delhihackathon/screens/home/MakeNGOProfile.dart';
import 'package:delhihackathon/screens/wrapper.dart';
import 'package:delhihackathon/services/auth.dart';
import 'package:delhihackathon/models/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserUid?>.value(
        value: AuthService().user,
        initialData: null,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/ngoprofile': (context) => MakeNGOProfile(),
          },
          theme: ThemeData(
            textTheme: GoogleFonts.montserratTextTheme(),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Wrapper(),
        ));
  }
}
