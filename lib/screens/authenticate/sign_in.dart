import 'package:delhihackathon/screens/authenticate/register.dart';
import 'package:delhihackathon/screens/home/bnb.dart';
import 'package:delhihackathon/screens/home/home.dart';
import 'package:delhihackathon/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/sign_in/email_input.dart';
import 'components/sign_in/password_input.dart';
import 'package:delhihackathon/screens/authenticate/authenticate.dart';



class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SignIn> {

  AuthService _auth=AuthService();
  var isVisible = false;
  String email = '';
  String password = '';
  String error= '';
  void changeVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF83458A),
      appBar: AppBar(
        backgroundColor: Color(0xFFFED0CB),
        elevation: 0,
        title: Text(
          "LOG IN",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: 230,
                  decoration: BoxDecoration(
                      color: Color(0xFFFED0CB),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                ),
                Image.asset(
                  'assests/login_page/Login.png',
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                "WELCOME",
                style: TextStyle(
                  color: Color(0xFFFED0CB),
                  fontWeight: FontWeight.w900,
                  fontSize: 40,
                ),
              ),
            ),
            Form(
              child: Column(
                children:<Widget>[ Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(colorScheme: ThemeData().colorScheme.copyWith()),
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
                          hintStyle: TextStyle(
                            color: Color(0xFFFFE5E2),
                            fontSize: 18,
                          ),
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
              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
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
                  hintStyle: TextStyle(
                    color: Color(0xFFFFE5E2),
                    fontSize: 18,
                  ),
                  fillColor: Color.fromRGBO(242, 175, 217, 0.45),
                  focusColor: Color.fromRGBO(242, 175, 217, 0.45),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
              child: Center(
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Color(0xFFFED0CB),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Center(
                child: ElevatedButton(
                  onPressed: () async{
                        dynamic result=await _auth.SignInwithEmailPassword(email, password);
                        if(result==null)
                          {
                            setState(() {
                              error="enter valid email or password";
                            });
                          }
                        else
                          {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>Tabbar()));
                          }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: Color(0xFFFED0CB),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                  child: Text(
                    "Login",
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
                  "Don't have an account yet?",
                  style: TextStyle(
                    color: Color(0xFFFED0CB),
                    fontSize: 15,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Register()));
                  },
                  child: Text(
                    "Create Account",
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
        ),
      ),
    );
  }
}