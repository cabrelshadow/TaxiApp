import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/trajetmodels/trajetmodel.dart';

class DetailTrajet extends StatefulWidget {

  final  Trajetmodel trajetmodel;
  const DetailTrajet({Key? key, required this.trajetmodel}) : super(key: key);

  @override
  State<DetailTrajet> createState() => _DetailTrajetState();
}

class _DetailTrajetState extends State<DetailTrajet> {
  get  index => null;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text(widget.trajetmodel.villeArriver,style: GoogleFonts.roboto(
              fontSize: 15,

            ),),
            Text(widget.trajetmodel.villeDepart,style: GoogleFonts.roboto(
              fontSize: 15,

            ),),
          ],
        ),
      ),
    );
  }
}
