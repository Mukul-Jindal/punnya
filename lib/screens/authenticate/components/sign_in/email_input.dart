// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Theme(
        data: Theme.of(context)
            .copyWith(colorScheme: ThemeData().colorScheme.copyWith()),
        child: TextFormField(
          onChanged: (val)
          {

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
    );
  }
}
