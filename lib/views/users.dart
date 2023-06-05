import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          "profile d'\ utilisateur",
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 17, color: appcolor),

        ),

      ),
    );
  }
}
