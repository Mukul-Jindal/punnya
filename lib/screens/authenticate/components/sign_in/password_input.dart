// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PassowordInput extends StatefulWidget {
  const PassowordInput({super.key});

  @override
  State<PassowordInput> createState() => _PassowordInputState();
}

class _PassowordInputState extends State<PassowordInput> {
  var isVisible = false;
  void changeVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
      child: TextFormField(
        obscureText: !isVisible,
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
    );
  }
}
