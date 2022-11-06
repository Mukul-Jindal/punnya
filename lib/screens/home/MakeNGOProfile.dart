// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delhihackathon/screens/home/home.dart';
import 'package:delhihackathon/screens/home/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import '../../services/auth.dart';
import '../../services/database.dart';
import 'bnb.dart';

class MakeNGOProfile extends StatefulWidget {
  const MakeNGOProfile({Key? key}) : super(key: key);

  @override
  State<MakeNGOProfile> createState() => _MakeNGOProfileState();
}

class _MakeNGOProfileState extends State<MakeNGOProfile> {

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> updateUser() {
    return users
        .doc('/ngoinfo/dwaURgfolGMAEpvDqM5TOiStNDk1')
        .update({'organization_bank_details': 'Stokes and Sons'})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
   String _current_organization_name = "";
   String _current_organization_location = "";
   String _current_organization_info = "";
   String _current_organization_connectivity = "";
   String _current_organization_contact = "";
   String _current_organization_other_contact = "";
   String _current_organization_bank_details = "";
   String _current_organization_focus = "";
   String _current_organization_donation_featured = "";
   String _current_organization_donation_socialmedia_link = "";

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    final user = Provider.of<UserUid?>(context);
    return StreamBuilder<NgoData>(

        stream: DatabaseServices(uid: user?.uid).ngoData,
        builder: (context, snapshot) {
            return SafeArea(
              child: Scaffold(
                extendBody: true,
                backgroundColor: Colors.white,
                appBar: AppBar(
                    centerTitle: true,
                    backgroundColor: Colors.white,
                    leading: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        )),
                    title: Stack(children: [
                      Center(
                        child: Text(
                          "Register NGO",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ])),
                body: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 60,
                            child: TextFormField(

                              onChanged: (val) => setState(() {
                                _current_organization_name = val;
                              }),
                              keyboardType:TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "Enter the name of Organisation",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: 17,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Color.fromRGBO(178, 112, 162, 0.17000000178813934),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            child: TextFormField(

                              onChanged: (val) => setState(() {
                                _current_organization_location = val;
                              }),
                              keyboardType:TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "Enter location",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: 17,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Color.fromRGBO(178, 112, 162, 0.17000000178813934),
                              ),
                            ),
                          ),
                          TextFormField(
                            onChanged: (val)=>setState(() {
                              _current_organization_info=val;
                            }),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Description",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Color.fromRGBO(
                                  178, 112, 162, 0.17000000178813934),
                            ),
                            maxLines: 6,
                          ),
                          SizedBox(
                            height: 60,
                            child: TextFormField(

                              onChanged: (val) => setState(() {
                                _current_organization_connectivity = val;
                              }),
                              keyboardType:TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "Connectivity count",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: 17,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Color.fromRGBO(178, 112, 162, 0.17000000178813934),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            child: TextFormField(

                              onChanged: (val) => setState(() {
                                _current_organization_contact = val;
                              }),
                              keyboardType:TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "Contact number",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: 17,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Color.fromRGBO(178, 112, 162, 0.17000000178813934),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            child: TextFormField(

                              onChanged: (val) => setState(() {
                                _current_organization_other_contact = val;
                              }),
                              keyboardType:TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "Other contact",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: 17,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Color.fromRGBO(178, 112, 162, 0.17000000178813934),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            child: TextFormField(

                              onChanged: (val) => setState(() {
                                _current_organization_bank_details = val;
                              }),
                              keyboardType:TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "Provide bank details",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: 17,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Color.fromRGBO(178, 112, 162, 0.17000000178813934),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(
                                  178, 112, 162, 0.17000000178813934),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: Text(
                                  "Choose your Focus",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                            //Dropdown Menu Daalna iddar
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(
                                  178, 112, 162, 0.17000000178813934),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 60,

                            //Dropdown Menu Daalna iddar
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: Text(
                                  "Is Donation Featured?",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                              //Yaha bhi Dropdown Menu dallna hai
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(
                                  178, 112, 162, 0.17000000178813934),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            height: MediaQuery.of(context).size.height / 7,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Social Media Links :",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          "assets/MakeNGO/Facebook.png",
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                            "assets/MakeNGO/Twitter.png"),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                            "assets/MakeNGO/Linkedin.png"),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                            "assets/MakeNGO/Instagram.png"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "Upload Photos/Videos Here:",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(
                                      178, 112, 162, 0.17000000178813934),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () async {},
                                child: Container(
                                  height: 45,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                    ),
                                    color: Color.fromRGBO(178, 112, 162, 1),
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      await DatabaseServices(uid: user?.uid)
                                          .updateNgoData(
                                        _current_organization_name,
                                        _current_organization_location,
                                        _current_organization_info,
                                        _current_organization_connectivity,
                                        _current_organization_contact,
                                        _current_organization_other_contact,
                                        _current_organization_bank_details,
                                        _current_organization_focus,
                                        _current_organization_donation_featured,
                                        _current_organization_donation_socialmedia_link,
                                      );
                                      await updateUser();
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Tabbar()));
                                    },
                                    child: Center(
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
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

class Input extends StatefulWidget {
  Input({
    Key? key,
    required this.hintText,
    required this.boxHeight,
    required this.keyboardType,
    required this.purpose,
  }) : super(key: key);
  String hintText = "";
  bool keyboardType;
  double boxHeight;
  String purpose;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.boxHeight,
      child: TextFormField(
        onChanged: (val) => setState(() {
          print(widget.purpose);
          widget.purpose = val;
        }),
        keyboardType:
            widget.keyboardType ? TextInputType.text : TextInputType.number,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            fontSize: 17,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Color.fromRGBO(178, 112, 162, 0.17000000178813934),
        ),
      ),
    );
  }
}
