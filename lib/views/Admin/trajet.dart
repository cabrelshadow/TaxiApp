import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../constants/image_string.dart';
import '../../models/trajetmodels/trajetmodel.dart';
class Trajets extends StatefulWidget {
  const Trajets({Key? key}) : super(key: key);

  @override
  State<Trajets> createState() => _TrajetsState();
}
// Fonction de suppression Firebase Firestore
void deleteDocument(String docId) {
  FirebaseFirestore.instance.collection('trajets').doc(docId).delete();
}
class _TrajetsState extends State<Trajets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(" liste des trajets" ,style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 17,color:appcolor),),
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
                final DocumentSnapshot document = snapshot.data!.docs[index];
                return InkWell(

                  onTap: (){

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
                        Divider(color: Colors.grey),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('action', style:GoogleFonts.poppins( fontSize: 13, fontWeight: FontWeight.bold)),
                            InkWell(
                              onTap: (){
                                deleteDocument(document.id);
                                _successsMessage(context);
                              },
                              child: Icon(Icons.restore_from_trash_sharp,color: Colors.red,),
                            )

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
  _successsMessage(BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Container(
          padding: EdgeInsets.all(8),
          height: 80,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(children: [
            Icon(Icons.check_circle,color: Colors.white,size: 40,),
            SizedBox(width: 20,),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Succès",style: GoogleFonts.poppins(),),
                Spacer(),
                Text("trajet supprimer avec succes!",style: GoogleFonts.poppins(),),
              ],
            ))
          ],),
        )
            ,behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
            duration:Duration(seconds: 4),
            dismissDirection: DismissDirection.vertical


        )
    );
  }
}
