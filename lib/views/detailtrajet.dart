import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxiapp/views/sierge.dart';
import 'package:taxiapp/views/test.dart';

import '../constants/colors.dart';
import '../models/trajetmodels/trajetmodel.dart';

class DetailTrajet extends StatefulWidget {

  final  Trajet trajet;
  const DetailTrajet({Key? key, required this.trajet,}) : super(key: key);

  @override
  State<DetailTrajet> createState() => _DetailTrajetState();
}

class _DetailTrajetState extends State<DetailTrajet> {
  get  index => null;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("detail trajet  " ,style: GoogleFonts.poppins( fontSize: 16),),
      ),
      body:  Column(

        children: [
          Container(
            padding: EdgeInsets.all(14),
            child: Column(
              children: [
                Text("les details du ticket sont fornis lors de la selection du ticket",style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: appcolor,
                    fontSize:15
                ),)
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.symmetric(vertical: 70,horizontal:20 ),

            height: 450,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Ville de départ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('Ville d\'arrivée', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.trajet.villeDepart, style:GoogleFonts.poppins( fontSize: 14)),
                    Text(widget.trajet.villeArrivee, style:GoogleFonts.poppins( fontSize: 14)),
                  ],
                ),
                SizedBox(height: 10),
                Divider(color: Colors.grey),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Heure de départ: ${widget.trajet.heureDepart}', style:GoogleFonts.poppins( fontSize: 14)),
                    Text('${widget.trajet.prix} Fcfa',  style:GoogleFonts.poppins( fontSize: 14)),
                  ],
                ),
                SizedBox(height: 10),
                Divider(color: Colors.grey),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Siège Numero :',style:GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 14),),
                    Text('50', style:GoogleFonts.poppins( fontSize: 14)),
                  ],
                ),
                SizedBox(height: 40,),
                greenButton("Reserver maintenant",(){
                  Get.to(Sierge());
                })
              ],
            ),

          ),


        ],
      ),
    );
  }
}
Widget greenButton(String title, Function onPressed) {
  return MaterialButton(
    minWidth: Get.width,
    height: 50,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    color: appcolor,
    onPressed: () => onPressed(),
    child: Text(
      title,
      style: GoogleFonts.poppins(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}


