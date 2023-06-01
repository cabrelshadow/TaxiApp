import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:taxiapp/constants/colors.dart';
import 'package:taxiapp/views/profile_settings.dart';
import 'package:taxiapp/views/users.dart';

import '../constants/image_string.dart';
import '../controller/auth_controller.dart';
class DrawerNavigator extends StatefulWidget {
  const DrawerNavigator({Key? key}) : super(key: key);

  @override
  State<DrawerNavigator> createState() => _DrawerNavigatorState();
}

class _DrawerNavigatorState extends State<DrawerNavigator> {
  AuthController authController= Get.find<AuthController>();
  @override
  void initState(){
    super.initState();
    authController.getUser();

  }
  Widget build(BuildContext context) {
    return Drawer(
       width: 250,
      child: ListView(
        children:  [
          UserAccountsDrawerHeader(

              accountName: Text(authController.myuser.value.Unom?? "",style: GoogleFonts.poppins( color: Colors.white),),
              accountEmail: Text(authController.myuser.value.Uprenom?? ""),
              currentAccountPicture: CircleAvatar(
                backgroundColor:Colors.transparent,
                      child: InkWell(
                        onTap:()=>Get.to(ProfileSettingScreen()),
                        child: ClipOval(
                            child: Image(image:  NetworkImage(authController.myuser.value.Uimage?? ""),fit:BoxFit.cover ,height: 100 ,width: 100,)),
                      ),

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
              onTap: (){
                 authController.SignOut();
              }
          ),
          Divider(
            thickness: 1,

          ),
        ],
      )
    );
  }
}
