import 'package:flutter/material.dart';
import 'package:taxiapp/constants/colors.dart';
class MyTextFiled extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

   const MyTextFiled({
     super.key,
     required this.controller,
     required this.hintText,
     required this.obscureText
   });

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
          obscureText: obscureText,
        decoration:InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color:appcolor)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,

        ) ,
      ),
    );
  }
}
