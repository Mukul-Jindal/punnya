// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:delhihackathon/models/user.dart';
import 'package:delhihackathon/screens/home/Profile_page.dart';
import 'package:delhihackathon/screens/home/bnb.dart';
import 'package:delhihackathon/screens/home/profile.dart';
import 'package:delhihackathon/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:delhihackathon/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import '../../models/info_model.dart';

class MakeProfile extends StatefulWidget {
  const MakeProfile({Key? key}) : super(key: key);

  @override
  State<MakeProfile> createState() => _ProfileState();
}

class _ProfileState extends State<MakeProfile> {
  final _formKey = GlobalKey<FormState>();

  String _currentname = "";
  String _currentphone = "";
  String _currentcity = "";
  String _currentage = "";

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    final user = Provider.of<UserUid?>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseServices(uid: user?.uid).userData,
        builder: (context, snapshot) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                actions:<Widget> [
                  IconButton(
                      onPressed: () async {
                        await _auth.signOut();
                      },
                      icon: Icon(Icons.person,
                      color: Colors.black,)),
                ],
                title: Text(
                  "Make Your Profile",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
                backgroundColor: Colors.white,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    // height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 5,
                          child: Image(
                            image: AssetImage('assests/Profile_Page/man2.png'),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Enter your Name",
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Color.fromRGBO(
                                      178, 112, 162, 0.17000000178813934),
                                ),
                                onChanged: (val) => setState(() {
                                  _currentname = val;
                                }),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Enter contact number",
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Color.fromRGBO(
                                      178, 112, 162, 0.17000000178813934),
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.number,
                                onChanged: (val) => setState(() {
                                  _currentphone = val;
                                }),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Enter your city",
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Color.fromRGBO(
                                      178, 112, 162, 0.17000000178813934),
                                ),
                                  onChanged: (val) => setState(() {
                                    _currentcity = val;
                                  }),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Enter your age",
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Color.fromRGBO(
                                      178, 112, 162, 0.17000000178813934),
                                ),
                                onChanged: (val) => setState(() {
                                  _currentage = val;
                                }),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: () async {
                                await DatabaseServices(uid: user?.uid)
                                    .updateUserData(_currentname, _currentphone,
                                        _currentcity, _currentage,);
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const Tabbar()));
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Color.fromRGBO(
                                    178, 112, 162, 0.17000000178813934),
                              ),
                              child: Text(
                                "Done",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 40),
                            Image(
                              image: AssetImage(
                                  'assests/Profile_Page/Artboard21.png'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
