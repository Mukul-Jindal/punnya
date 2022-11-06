import 'package:delhihackathon/screens/authenticate/sign_in.dart';
import 'package:delhihackathon/screens/home/Make_Your_Profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:delhihackathon/screens/wrapper.dart';
import '../../services/auth.dart';
import 'components/sign_in/email_input.dart';
import 'components/sign_in/password_input.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  AuthService _auth = AuthService();
  String email = "";
  String password = "";
  String error = "";
  var isVisible = false;
  void changeVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 25,
          ),
        ),
        backgroundColor: Color(0xFFFED0CB),
        elevation: 0,
      ),
      backgroundColor: Color(0xFFFED0CB),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 88,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.6,
                decoration: BoxDecoration(
                  color: Color(0xFF83458A),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assests/login_page/Login.png",
                    fit: BoxFit.cover,
                  ),
                  Form(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                          child: Theme(
                            data: Theme.of(context).copyWith(
                                colorScheme: ThemeData().colorScheme.copyWith()),
                            child: TextFormField(
                              onChanged: (val) {
                                setState(() {
                                  email = val;
                                });
                              },
                              decoration: InputDecoration(
                                filled: true,
                                prefixIcon: Icon(Icons.email_outlined),
                                hintText: "Enter your Email",
                                hintStyle: TextStyle(color: Color(0xFFFFE5E2)),
                                fillColor: Color.fromRGBO(242, 175, 217, 0.45),
                                focusColor: Color.fromRGBO(242, 175, 217, 0.45),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                          child: TextFormField(
                            obscureText: !isVisible,
                            onChanged: (val) {
                              setState(() {
                                password = val;
                              });
                            },
                            decoration: InputDecoration(
                              filled: true,
                              prefixIcon: Icon(Icons.key_outlined),
                              suffixIcon: IconButton(
                                  onPressed: changeVisibility,
                                  icon: !isVisible
                                      ? Icon(Icons.visibility_outlined)
                                      : Icon(Icons.visibility_off_outlined)),
                              hintText: "Enter your Password",
                              hintStyle: TextStyle(color: Color(0xFFFFE5E2)),
                              fillColor: Color.fromRGBO(242, 175, 217, 0.45),
                              focusColor: Color.fromRGBO(242, 175, 217, 0.45),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () async{
                          dynamic result = await _auth.RegisterwithEmailPassword(
                              email, password);
                          if (result == null) {
                            setState(() {
                              error = "enter valid email or password";
                            });
                          } else {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => const MakeProfile()));
                          }
                        },

                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: Color(0xFFFED0CB),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                        ),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Center(
                      child: Text(
                        "Or login with",
                        style: TextStyle(
                          color: Color(0xFFFED0CB),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent),
                          elevation: MaterialStatePropertyAll(0),
                        ),
                        onPressed: () {
                          // Code to login with google
                        },
                        child: Image.asset(
                          'assests/login_page/google.png',
                          height: 30,
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent),
                          elevation: MaterialStatePropertyAll(0),
                        ),
                        onPressed: () {
                          // Code to login with facebook
                        },
                        child: Image.asset(
                          'assests/login_page/facebook.png',
                          height: 30,
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent),
                          elevation: MaterialStatePropertyAll(0),
                        ),
                        onPressed: () {
                          // Code to login with phone number
                        },
                        child: Image.asset(
                          'assests/login_page/telephone.png',
                          height: 30,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already a user?",
                        style: TextStyle(
                          color: Color(0xFFFED0CB),
                          fontSize: 15,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SignIn()));
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Color(0xFFFED0CB),
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
