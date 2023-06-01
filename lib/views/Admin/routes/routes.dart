import 'package:get/get.dart';
import 'package:taxiapp/views/Admin/admin_homepage.dart';
import 'package:taxiapp/views/Admin/create_trajets.dart';
import 'package:taxiapp/views/Admin/navbar.dart';
import 'package:taxiapp/views/Admin/user_reservation.dart';

import '../../historique_trajet.dart';




class AppPage{
  static List<GetPage> routes=[
    GetPage(name: navbar, page: ()=>  NavBar()),
    GetPage(name: homePage, page: ()=>  AdminHomePage()),
    GetPage(name: createTrajet, page: ()=>  CreateTrajet()),
    GetPage(name: historiquereservation, page: ()=> ReservationWidget()),
    GetPage(name: userReservation , page: ()=> ReservationList()),

  ];
  static getnavbar()=>navbar;
  static gethome()=>homePage;
  static getcreateTrajet()=>createTrajet;
  static gethistoriquereservation()=>historiquereservation;
  static getUserReservation()=>userReservation ;

  static String navbar='/';
  static String homePage='/homePage';
  static String createTrajet='/createTrajet';
  static String historiquereservation='/historiquereservation';
  static String userReservation ='/userReservation ';


}