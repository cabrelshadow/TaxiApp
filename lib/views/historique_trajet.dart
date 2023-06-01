import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';


import '../constants/colors.dart';
import '../constants/image_string.dart';

class ReservationWidget extends StatefulWidget {
  const ReservationWidget({super.key});

  @override
  _ReservationWidgetState createState() => _ReservationWidgetState();
}

class _ReservationWidgetState extends State<ReservationWidget> {
  bool _isLoading = true;
  List<Map<String, dynamic>>? _userDataList;

  @override
  void initState() {
    super.initState();
    displayUserData();
  }

  Future<void> displayUserData() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    var userDocs = await FirebaseFirestore.instance.collection('reservations').where('uid', isEqualTo: uid).get();

    if (userDocs.docs.isEmpty) {
      // L'utilisateur n'a pas de réservation enregistrée
      setState(() {
        _isLoading = false;
      });
      return;
    }

    var userDataList = userDocs.docs.map((doc) => doc.data()).toList();
    setState(() {
      _userDataList = userDataList;
      _isLoading = false;
    });
  }

  Widget buildReservationCard(Map<String, dynamic> reservationData) {
    return  Container(
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
              Text('${reservationData['villedepart']}',style:GoogleFonts.poppins( fontSize: 13)),
              Image(image: AssetImage(flech),height: 30,width: 30,),
              Text(' ${reservationData['villeArriver']}', style:GoogleFonts.poppins( fontSize: 13)),
            ],
          ),
          SizedBox(height: 6),
          Divider(color: Colors.grey),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(' ${reservationData['heurDepart']}', style:GoogleFonts.poppins( fontSize: 13)),
              Text('${reservationData['prix']} fcfa', style:GoogleFonts.poppins( fontSize: 13)),
            ],
          ),
          Divider(color: Colors.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('date du voyage', style:GoogleFonts.poppins( fontSize: 13, fontWeight: FontWeight.bold)),
              Text('${reservationData['date']}', style:GoogleFonts.poppins( fontSize: 13)),

            ],
          ),
          Divider(color: Colors.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Numero de siège', style:GoogleFonts.poppins( fontSize: 13, fontWeight: FontWeight.bold)),
              Text('${reservationData['numerosierge']}', style:GoogleFonts.poppins( fontSize: 13)),

            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          "historique des reservations",
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 17, color: appcolor),

        ),
        actions: [
          IconButton(onPressed: (){

            displayUserData();

          }, icon: Icon(Icons.refresh),color: appcolor,)
        ],
      ),
      body: _isLoading
          ? CircularProgressIndicator()
          : (_userDataList == null || _userDataList!.isEmpty
          ? Column(
        children: [
          Container(
            padding: EdgeInsets.only(top:150),
            child: Center(
              child: Text("votre historique est vide !!",style: GoogleFonts.poppins(
                fontSize: 15,
              ),),
            ),
          ),
          Center(
            child: Image(image: AssetImage(notfound),width: 200, height: 200,),
          )
        ],
      )
          : ListView.builder(
        itemCount: _userDataList!.length,
        itemBuilder: (context, index) {
          var userData = _userDataList![index];
          return Column(
            children: [
              buildReservationCard(userData),
              SizedBox(height: 10),
            ],
          );
        },
      )),
    );
  }
}