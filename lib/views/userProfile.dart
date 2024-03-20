import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxiapp/views/navbar.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _adresseController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _registerUser() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _nomController.text + '@example.com', // Utilisez le nom comme base pour l'email
        password: 'password', // Vous pouvez générer un mot de passe plus sécurisé ici
      );

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'nom': _nomController.text,
        'prenom': _prenomController.text,
        'adresse': _adresseController.text,
      });

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => NavBar()));
    } catch (e) {
      print('Error during registration: $e');
      // Afficher un message d'erreur à l'utilisateur, par exemple avec un SnackBar
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nomController,
              decoration: InputDecoration(labelText: 'Nom'),
            ),
            TextField(
              controller: _prenomController,
              decoration: InputDecoration(labelText: 'Prénom'),
            ),
            TextField(
              controller: _adresseController,
              decoration: InputDecoration(labelText: 'Adresse'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _registerUser,
              child: Text('Inscription'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Bienvenue sur la page d\'accueil !'),
      ),
    );
  }
}
