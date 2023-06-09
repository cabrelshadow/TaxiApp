import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/sizes.dart';
import '../constants/text_strings.dart';

class ForgetPasswordScreen{
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return
      showModalBottomSheet(

      context: context,
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.0) ),
      builder: (context)=>Container(
        padding: EdgeInsets.all(tDefauldSize),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tForgetPasswordTitle, style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 19)),
            Text(tForgetPasswordSubTitle, style: GoogleFonts.poppins(fontSize: 16)),
            SizedBox(height: 30.0,),

            SizedBox(height: 21.0,),


          ],
        ),
      ),
    );
  }

}