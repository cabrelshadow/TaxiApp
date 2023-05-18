import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:taxiapp/constants/colors.dart';
import 'package:taxiapp/views/users.dart';

import '../constants/image_string.dart';
class DrawerNavigator extends StatefulWidget {
  const DrawerNavigator({Key? key}) : super(key: key);

  @override
  State<DrawerNavigator> createState() => _DrawerNavigatorState();
}

class _DrawerNavigatorState extends State<DrawerNavigator> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: ListView(
        children:  [
          UserAccountsDrawerHeader(
            
            accountName: Text("cabrel sianou"),
            accountEmail: Text("sianou93@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor:Colors.transparent,
                    child: ClipOval(
                        child: Image(image:   AssetImage(profile,),fit:BoxFit.cover ,height: 100 ,width: 100,)),

                    ),
            decoration: BoxDecoration(
              color: appcolor,
            ),
            ),
            ListTile(
              leading:Icon(Icons.supervised_user_circle_sharp,size: 30,color: appcolor,),
              title: Text("user profile",style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
              )),
              onTap: ()=>Get.to(UserPage())
            ),
          Divider(
            thickness: 1,
          ),
          ListTile(
              leading:Icon(Icons.add_road,size: 30,color: appcolor,),
              title:  Text("trajet",style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
              )),
              onTap: ()=>Get.to(UserPage())
          ),
                    Divider(
                      thickness: 1,
                    ),
          ListTile(
              leading:Icon(Icons.settings,size: 30,color: appcolor,),
              title:   Text("parametre",style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
              )),
              onTap: ()=>Get.to(UserPage())
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
              leading:Icon(Icons.login_sharp,size: 30,color: appcolor,),
              title:  Text("se deconnecter",style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
              )),
              onTap: ()=>Get.to(UserPage())
          ),
          Divider(
            thickness: 1,

          ),
        ],
      )
    );
  }
}
