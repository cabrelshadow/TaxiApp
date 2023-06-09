import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:taxiapp/controller/mobile.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../constants/colors.dart';
import '../constants/image_string.dart';
import 'package:intl/intl.dart';

import '../constants/sizes.dart';
import '../constants/text_strings.dart';

class ReservationWidget extends StatefulWidget {
  const ReservationWidget({super.key});

  @override
  _ReservationWidgetState createState() => _ReservationWidgetState();
}

class _ReservationWidgetState extends State<ReservationWidget> {
  String message = "";
  bool _isLoading = true;
  List<Map<String, dynamic>>? _userDataList;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<QueryDocumentSnapshot> _reservations = [];


  @override
  void initState() {
    super.initState();
    displayUserData();
  }
  void _makePayment() async {
    await initializePayment();
    // Traiter la réponse ici
  }
  Future<void> displayUserData() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    var userDocs = await FirebaseFirestore.instance
        .collection('reservations')
        .doc(uid)
        .collection('reservations')
        .get();

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


  Future<void> _deleteReservation(String reservationId) async {
    await _firestore.collection('reservations').doc(reservationId).delete();
    setState(() {
      _reservations.removeWhere((reservation) => reservation.id == reservationId);
    });
  }
  Widget buildReservationCard(Map<String, dynamic> reservationData,Function onPressed) {
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
              Text('heur de depart:', style:GoogleFonts.poppins( fontSize: 13,fontWeight: FontWeight.bold)),
              Text(' ${reservationData['heurDepart']}', style:GoogleFonts.poppins( fontSize: 13)),
            ],
          ),
          Divider(color: Colors.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('prix a payer :', style:GoogleFonts.poppins( fontSize: 13,fontWeight: FontWeight.bold)),
              Text('${reservationData['prix']} fcfa', style:GoogleFonts.poppins( fontSize: 13)),
            ],
          ),
          Divider(color: Colors.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('date du voyage :', style:GoogleFonts.poppins( fontSize: 13, fontWeight: FontWeight.bold)),
              Text('${reservationData['date']}', style:GoogleFonts.poppins( fontSize: 13)),

            ],
          ),
          Divider(color: Colors.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Numero de siège:', style:GoogleFonts.poppins( fontSize: 13, fontWeight: FontWeight.bold)),
              Text('${reservationData['numerosierge']}', style:GoogleFonts.poppins( fontSize: 13)),

            ],
          ),
          Divider(color:appcolor),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Nombre de place :', style:GoogleFonts.poppins( fontSize: 13, fontWeight: FontWeight.bold)),
              Text('${reservationData['nombre_personne']}', style:GoogleFonts.poppins( fontSize: 13)),

            ],
          ),
          Divider(color:appcolor),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: (){
                showModalBottomSheet(

                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)
                      ) ),
                  builder: (context)=>Container(
                    padding: EdgeInsets.all(tDefauldSize),

                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(tForgetPasswordTitle, style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 19)),

                          SizedBox(height: 30.0,),
                          Column(
                            children: [
                              Container(

                              padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius:BorderRadius.circular(10),
                                  color: Colors.grey[200],

                                ),
                                child: Row(
                                  children: [
                                    Image(image: AssetImage(orange),width: 100,height: 100,),
                                    Text("Orange Money",style: GoogleFonts.roboto(fontWeight: FontWeight.bold),)
                                  ],
                                ),

                              ),
                              SizedBox(height: 20,),
                              Container(

                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius:BorderRadius.circular(10),
                                  color: Colors.grey[200],

                                ),
                                child: Row(
                                  children: [
                                    Image(image: AssetImage(mtn),width: 100,height: 100,),
                                    Text("Mtn mobile money",style: GoogleFonts.roboto(fontWeight: FontWeight.bold),)
                                  ],
                                ),

                              ),
                            ],
                          ),

                          SizedBox(height: 21.0,),


                        ],
                      ),
                    ),
                  ),
                );

              }, child:Text("valider le ticket",style:
              GoogleFonts.poppins(fontWeight:
              FontWeight.bold,
                color: appcolor,
              ),)),
              TextButton(  onPressed: () => onPressed(), child:Text("imprimer",style:
              GoogleFonts.poppins(fontWeight:
              FontWeight.bold,
                color: Colors.red,
              ),))
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
          ? Column(
        children: const [
          Center( child: CircularProgressIndicator() , ) ,
        ],
      )
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
          //   String reservationId = _reservations[index].id;

          return Column(
            children: [
              buildReservationCard(userData,(){
                DateTime date = DateTime.parse(_userDataList![index]['date'].toString());
                String formattedDate = DateFormat('MMMM dd yyyy hh:mm').format(date);
                PrintTicket(


                   _userDataList![index]['nom_utilisateur'].toString(),
                    formattedDate,
                    _userDataList![index]['prix'].toString(),
                    _userDataList![index]['nombre_personne'].toString(),
                    _userDataList![index]['type_voyage'].toString(),

                );
              }),
              SizedBox(height: 10),
            ],
          );
        },
      )),
    );
  }
  Future<void> initializePayment() async {
    final response = await http.get(Uri.parse('https://api.notchpay.co/payments/initialize'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        message = data['message'];
      });
    } else {
      throw Exception('Failed to load data');
    }
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
                Text("paiement effectué avec succes!",style: GoogleFonts.poppins(),),
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
  Future<void> PrintTicket(String nom,String date,String prix,String place,String type_voyage) async {
    final pdf = pw.Document();
    //final image = pw.MemoryImage(File("assets/bus.png").readAsBytesSync());


    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a5,
      build: (pw.Context context) {
        return pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: <pw.Widget>[

            pw.Text('Easy Travel', style: pw.TextStyle(
                fontSize: 24, fontWeight: pw.FontWeight.bold)),
            pw.Divider(),
            pw.SizedBox(height: 50),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: <pw.Widget>[
                pw.Text('Nom:',
                    style: pw.TextStyle(fontSize: 16)),
                pw.Text('$nom',
                    style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
              ],
            ),
            pw.SizedBox(height: 20),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: <pw.Widget>[
                pw.Text('Date resever:',
                    style: pw.TextStyle(fontSize: 16)),
                pw.Text('$date',
                    style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
              ],
            ),
            pw.SizedBox(height: 20),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: <pw.Widget>[
                pw.Text('prix:',
                    style: pw.TextStyle(fontSize: 16)),
                pw.Text('$prix',
                    style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
              ],
            ),
            pw.SizedBox(height: 20),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: <pw.Widget>[
                pw.Text('Nombre de place:',
                    style: pw.TextStyle(fontSize: 16)),
                pw.Text('$place',
                    style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
              ],
            ),
            pw.SizedBox(height: 20),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: <pw.Widget>[
                pw.Text('type de voyage:',
                    style: pw.TextStyle(fontSize: 16)),
                pw.Text('$type_voyage',
                    style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
              ],
            ),
            pw.Divider(),
          ],
        );
      },
    ));


    List<int> bytes = await pdf.save();

    SaveAndLaundFile(bytes, 'tiket.pdf');
  }

}