import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../models/tarifsModels/tarif_models.dart';



class PlaceListPage extends StatefulWidget {
  @override
  _PlaceListPageState createState() => _PlaceListPageState();
}

class _PlaceListPageState extends State<PlaceListPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text("nos tarifs" ,style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 17,color:appcolor),),
      ),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (BuildContext context, int index) {
          final place = places[index];
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[400]!),
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place.name,
                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 19),
                ),
                SizedBox(height: 8.0),
                Text(
                  place.description,
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
                ),
                SizedBox(height: 8.0),
                Text(
                  '${place.price} FCFA',
                    style: GoogleFonts.roboto(fontSize: 15),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
