import 'package:delhihackathon/screens/authenticate/authenticate.dart';
import 'package:delhihackathon/screens/home/Bottom_navigation_bar.dart';
import 'package:delhihackathon/screens/home/Make_Your_Profile.dart';
import 'package:delhihackathon/screens/home/bnb.dart';
import 'package:delhihackathon/screens/home/home.dart';
import 'package:delhihackathon/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserUid?>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Tabbar();
    }
  }
}
