import 'package:flutter/material.dart';
class Trajet extends StatefulWidget {
  const Trajet({Key? key}) : super(key: key);

  @override
  State<Trajet> createState() => _TrajetState();
}

class _TrajetState extends State<Trajet> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("trajet")),
    );
  }
}
