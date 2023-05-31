import 'package:get/get.dart';
import 'package:taxiapp/views/Admin/admin_homepage.dart';
import 'package:taxiapp/views/Admin/create_trajets.dart';
import 'package:taxiapp/views/Admin/navbar.dart';

import '../../historique_trajet.dart';




class AppPage{
  static List<GetPage> routes=[
    GetPage(name: navbar, page: ()=>  NavBar()),
    GetPage(name: homePage, page: ()=>  AdminHomePage()),
    GetPage(name: createTrajet, page: ()=>  CreateTrajet()),
    GetPage(name: historiquereservation, page: ()=>  HistoriqueTrajet()),

  ];
  static getnavbar()=>navbar;
  static gethome()=>homePage;
  static getcreateTrajet()=>createTrajet;
  static gethistoriquereservation()=>historiquereservation;

  static String navbar='/';
  static String homePage='/homePage';
  static String createTrajet='/createTrajet';
  static String historiquereservation='/historiquereservation';


}