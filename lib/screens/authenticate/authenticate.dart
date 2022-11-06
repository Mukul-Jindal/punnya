import 'package:delhihackathon/screens/authenticate/register.dart';
import 'package:delhihackathon/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:delhihackathon/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  final AuthService _auth = AuthService();
  bool ShowSignIn = true;

  ToggleView() {
    setState(() {
      ShowSignIn = !ShowSignIn;
    });
  }


  @override
  Widget build(BuildContext context) {
    if (ShowSignIn) {
      return SignIn();
    }
    else {
      return Register();
    }
  }
}
