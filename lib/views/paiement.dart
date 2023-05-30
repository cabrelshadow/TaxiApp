import 'package:flutter/material.dart';
import 'package:taxiapp/constants/colors.dart';
class PaiementTicket extends StatefulWidget {
  const PaiementTicket({Key? key}) : super(key: key);

  @override
  State<PaiementTicket> createState() => _PaiementTicketState();
}

class _PaiementTicketState extends State<PaiementTicket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Paiement"),
      centerTitle: true,
      backgroundColor: appcolor,
    ),
      body: Column(
        children: const [
          Center(
            child: Text("finaliser la reservation"),

          )
        ],
      ),
    );
  }
}
