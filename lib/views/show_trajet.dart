import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../constants/image_string.dart';
import '../models/trajetmodels/trajetmodel.dart';
import 'detailtrajet.dart';



class TrajetsListScreen extends StatefulWidget {
  @override
  _TrajetsListScreenState createState() => _TrajetsListScreenState();
}

class _TrajetsListScreenState extends State<TrajetsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(" liste des trajet" ,style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 17,color:appcolor),),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('trajets').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          List<Trajet> trajets = snapshot.data!.docs.map((document) => Trajet.fromFirestore(document)).toList();
          if (trajets.length==0) {

            return Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top:150),
                  child: Center(
                    child: Text("pas de trajet disponible !!",style: GoogleFonts.poppins(
                      fontSize: 15,
                    ),),
                  ),
                ),
                Center(
                  child: Image(image: AssetImage(notfound),width: 200, height: 200,),
                )
              ],
            );
          }else{


            return ListView.builder(
              itemCount: trajets.length,
              itemBuilder: (BuildContext context, int index) {
                final trajet = trajets[index];
                return InkWell(

                  onTap: (){
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                      builder: (context)=>DetailTrajet(trajet:trajets[index] ,),));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
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
                            Text('Ville de départ', style:GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 14)),
                            Text('Ville d\'arrivée', style:GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 14)),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${trajet.villeDepart}',style:GoogleFonts.poppins( fontSize: 13)),
                            Image(image: AssetImage(flech),height: 30,width: 30,),
                            Text('${trajet.villeArrivee}', style:GoogleFonts.poppins( fontSize: 13)),
                          ],
                        ),
                        SizedBox(height: 6),
                        Divider(color: Colors.grey),
                        SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${trajet.heureDepart}', style:GoogleFonts.poppins( fontSize: 13)),
                            Text('${trajet.prix} fcfa', style:GoogleFonts.poppins( fontSize: 13)),
                          ],
                        ),
                        Divider(color: Colors.grey),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('date du voyage', style:GoogleFonts.poppins( fontSize: 13, fontWeight: FontWeight.bold)),
                            Text('${trajet.dateVoyage}', style:GoogleFonts.poppins( fontSize: 13)),

                          ],
                        ),
                      ],
                    ),
                  ),
                );

              },
            );

          }


        },
      ),
    );
  }
}

