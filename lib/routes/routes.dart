import 'package:get/get.dart';
import 'package:taxiapp/views/home.dart';
import 'package:taxiapp/views/navbar.dart';
import 'package:taxiapp/views/trajet.dart';

import '../views/homeScreen.dart';
class AppPage{
  static List<GetPage> routes=[
    GetPage(name: navbar, page: ()=> const NavBar()),
    GetPage(name: home, page: ()=> const HomeScreen()),
    GetPage(name: trajet, page: ()=> const TrajetList()),
  ];
  static getnavbar()=>navbar;
  static gethome()=>home;
  static gettrajet()=>trajet;

  static String navbar='/';
  static String home='/home';
  static String trajet='/trajet';
}