import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxiapp/constants/colors.dart';
class Mybutton extends StatelessWidget {
 final Function()?onTap;
   Mybutton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      margin:EdgeInsets.symmetric(horizontal: 25) ,
      decoration: BoxDecoration(
        color: appcolor,
        borderRadius: BorderRadius.circular(9)
      ),
      
      child: Center( child: Text("Se connecter" ,style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),),
    );
  }
}
