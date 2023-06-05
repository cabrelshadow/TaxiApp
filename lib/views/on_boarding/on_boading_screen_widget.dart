import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/sizes.dart';
import '../../models/model_on_boarding.dart';


class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(tDefauldSize),
      color: model.bgColor,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image(image: AssetImage(model.image),height: model.height*0.4,),
          Column(
            children:  [
              Text(model.title,textAlign: TextAlign.center,style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 22),),

              Text(model.subTitle,textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(fontSize:18,),),
            ],
          ),

          Text(model.counterText,style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
          SizedBox(height: 80.0,),
        ],
      ),
    );
  }
}