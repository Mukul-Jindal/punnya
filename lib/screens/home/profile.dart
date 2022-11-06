import 'package:delhihackathon/models/user.dart';
import 'package:delhihackathon/services/auth.dart';
import 'package:delhihackathon/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../models/info_model.dart';
import 'package:delhihackathon/screens/home/Make_Your_Profile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //image picker
  File? images;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery,maxWidth: 1800,maxHeight: 1800,
      );
      if (image == null) {
        print("image not found");
        return null;
      }
      final imageTemp = File(image.path);
      setState(() {
        this.images = imageTemp;
      });
    } on PlatformException catch (e) {
      print("failed to pick image: $e");
    }
  }

  ImageSetter(images)
  {
    if(images!=null)
      {
        return CircleAvatar(
          backgroundColor: Color(0xffB270A2),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: Image.file(images!,fit: BoxFit.fill,).image,
            )
        );
      }
    else
      {
        return CircleAvatar( child:Image(
          image: AssetImage(
              'assests/Profile_Page/man2.png'),
        )
        );
      }
  }

  //email fetching
  AuthService _auth = AuthService();

  String? userEmail = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserUid?>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseServices(uid: user?.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.requireData;
            return SafeArea(
              child: Scaffold(
                extendBody: true,
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: SizedBox(
                              height: 20,
                              child: Image(
                                image: AssetImage(
                                    'assests/Profile_Page/Arrow1.png'),
                                //
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * (0.31),
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height *
                                      (0.27),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        (0.25),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(178, 112, 162, 1),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(7),
                                        topRight: Radius.circular(7),
                                        bottomLeft: Radius.circular(7),
                                        bottomRight: Radius.circular(7),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.topCenter,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                7,
                                        child: InkWell(
                                          onTap: () {
                                            pickImage();
                                          },
                                          child:ImageSetter(images)
                                                )


                                      ),
                                      Center(
                                        child: Text(
                                          userData.name.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 25),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          "$userEmail",
                                          style: TextStyle(
                                            fontSize: 16,
                                            // color: Colors
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Image(
                                                    image: AssetImage(
                                                        'assests/Profile_Page/Location1.png'),
                                                    height: 25,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    userData.city.toString(),
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Image(
                                                    image: AssetImage(
                                                        'assests/Profile_Page/Phonecall1.png'),
                                                    height: 25,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    userData.phone.toString(),
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
                            height: MediaQuery.of(context).size.height / 6,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "TOTAL DONATION",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(131, 69, 138, 1),
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "₹100000",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "RECENT ACTIVITY",
                                      style: TextStyle(
                                        color: Color.fromRGBO(131, 69, 138, 1),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * (0.305),
                            width: MediaQuery.of(context).size.width,
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      (0.30),
                                  width: MediaQuery.of(context).size.width,
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
                                  height: MediaQuery.of(context).size.height *
                                      (0.27),
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Text(
                                            "Edit Profile",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 3,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Text(
                                            "Change Location",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 3,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Text(
                                            "Change Password",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 3,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  child: InkWell(
                                    onTap: () async {
                                      await _auth.signOut();
                                    },
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
                                      child: Center(
                                        child: Text(
                                          "Sign-Out",
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            print("no data");
            return MakeProfile();
          }
        });
  }
}
