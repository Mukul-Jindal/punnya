// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:delhihackathon/screens/home/profile_page_info.dart';
import 'package:delhihackathon/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/info_model.dart';

class Profile_Info extends StatefulWidget {
  const Profile_Info({Key? key}) : super(key: key);


  @override
  State<Profile_Info> createState() => _Profile_InfoState();
}

class _Profile_InfoState extends State<Profile_Info> {


  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Info>?>.value(
      value: DatabaseServices().info,
      initialData: null,
      child: ProfilePageInfo(),
    );
  }
}
