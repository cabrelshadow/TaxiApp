import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../constants/image_string.dart';

class ReservationList extends StatefulWidget {
  const ReservationList({super.key});

  @override
  _ReservationListState createState() => _ReservationListState();
}
class _ReservationListState extends State<ReservationList> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference reservations = FirebaseFirestore.instance.collection('reservations');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("historique de reservation client" ,style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 13,color:appcolor),),
        centerTitle: true,
        elevation: 2,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 7),

            child: IconButton(
              onPressed: (){
              },icon: Image(image: AssetImage(userIcon),),
            ),
          )
        ],
      ) ,
      body:  Container(
        child: FutureBuilder<QuerySnapshot>(
          future: reservations.get(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Une erreur s'est produite");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              List<Map<String, dynamic>> reservationsData = [];

              snapshot.data!.docs.forEach((DocumentSnapshot document) {
                Map<String, dynamic> resData = document.data() as Map<String, dynamic>;
                reservationsData.add(resData);
              });
             if(reservationsData.isEmpty){
               return  Column(
                 children: [
                   Container(
                     padding: EdgeInsets.only(top:150),
                     child: Center(
                       child: Text("pas de reservation client !!",style: GoogleFonts.poppins(
                         fontSize: 15,
                       ),),
                     ),
                   ),
                   Center(
                     child: Image(image: AssetImage(notfound),width: 200, height: 200,),
                   )
                 ],
               );
             }
              return ListView.builder(
                itemCount: reservationsData.length,
                itemBuilder: (context, index) {
                  return Container(
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
                            Text('${reservationsData[index]['villedepart']}',style:GoogleFonts.poppins( fontSize: 13)),
                            Image(image: AssetImage(flech),height: 30,width: 30,),
                            Text('${reservationsData[index]['villeArriver']}', style:GoogleFonts.poppins( fontSize: 13)),
                          ],
                        ),
                        SizedBox(height: 6),
                        Divider(color: Colors.grey),
                        SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('nom du client', style:GoogleFonts.poppins( fontSize: 13)),
                            Text(reservationsData[index]['nom_utilisateur'], style:GoogleFonts.poppins( fontSize: 13)),
                          ],
                        ),
                        Divider(color: Colors.grey),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('date reservé', style:GoogleFonts.poppins( fontSize: 13, fontWeight: FontWeight.bold)),
                            Text(reservationsData[index]['date'].toString(), style:GoogleFonts.poppins( fontSize: 13)),

                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }

            return Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top:150),
                  child: Center(
                    child: Text("chargement en cour .... !!",style: GoogleFonts.poppins(
                      fontSize: 15,
                    ),),
                  ),
                ),
                Center(
                  child: CircularProgressIndicator( color:appcolor,),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
