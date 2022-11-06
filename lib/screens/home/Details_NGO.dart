// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import '../../services/database.dart';
import 'bnb.dart';
import 'package:delhihackathon/screens/home/ngo_card.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _Details_NGOState();
}

class _Details_NGOState extends State<Explore> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              // Align(
              //   alignment: AlignmentDirectional.topStart,
              //   child: InkWell(
              //     onTap: () {},
              //     child: SizedBox(
              //       height: 20,
              //       child: Image(
              //         image: AssetImage("assests/Profile_Page/Arrow1.png"),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "   \"Search NGO\"",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 6, 0, 6),
                        child: Image(

                          image: AssetImage("assests/explore_page/Search1.png",
                          ),
                          height: 1,
                        ),
                      ),
                      filled: true,
                      fillColor:
                      Color.fromRGBO(178, 112, 162, 0.17000000178813934),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "NGO near you",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [NgoCard(),NgoCard(),
                ]
                  ),
                  ),
                ],

              ),
            ],
          ),
        ),
      ),
    );
  }
}


