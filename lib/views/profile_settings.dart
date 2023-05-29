
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:taxiapp/constants/colors.dart';
import 'package:taxiapp/views/homeScreen.dart';
import 'package:taxiapp/views/navbar.dart';

import '../utils/app_colors.dart';
import '../widgets/green_intro_wiget.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  //verifiacation du formulaire
GlobalKey<FormState> formKey =GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController homeController = TextEditingController();
  TextEditingController businessController = TextEditingController();


  final ImagePicker _picker = ImagePicker();
  File? selectedImage;
  getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      selectedImage = File(image.path);
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Container(
               height: Get.height*0.4,
               child: Stack(
                 children: [
                   greenIntroWidgetWithoutLogos(),
                   Align(
                     alignment: Alignment.bottomCenter,
                       child: InkWell(
                         onTap:(){ getImage(ImageSource.gallery);},
                         child: selectedImage == null ?Container(
                           width: 120,
                           height: 120,
                           margin: EdgeInsets.only(bottom: 20),
                           decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               color: Color(0xFFD6D6D6)
                           ),
                           child: Center(
                             child: Icon(Icons.camera_alt,size: 40, color: Colors.white,),
                           ),
                         ):Container(
                           width: 120,
                           height: 120,
                           margin: EdgeInsets.only(bottom: 20),
                           decoration: BoxDecoration(
                             image: DecorationImage(
                               image: FileImage(selectedImage!),
                               fit: BoxFit.cover

                             ),
                               shape: BoxShape.circle,
                               color: Color(0xFFD6D6D6)
                           ),
                           child: Center(

                           ),
                         ),
                       ),
                   ),



                 ],
               ),
             ),
            SizedBox(
              height: 20,

            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child:Form(

                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                       TextFieldWidget('nom',  Icons.person_outlined, nameController,(String? input){
                          if(input!.isEmpty){
                            return "le champs nom est obligatoir";
                          }
                          if(input.length<3){
                            return"le nom ne peut pas etre 2 caractaire minimum 3";
                          }
                          return null;
                       }),
                      SizedBox( height: 10),

                      TextFieldWidget('prenom',  Icons.person_outlined, homeController,(String? input){
                        if(input!.isEmpty){
                          return "le champs prenom est obligatoir";
                        }
                    return null;
                      }),
                      SizedBox( height: 10),

                      TextFieldWidget('ville de redisence',  Icons.home_outlined, businessController,(String,input){
                        if(input!.isEmpty){
                          return "le champs ville de residance  est obligatoir";
                        }
                        return null;
                      }),
                      SizedBox( height: 10),


                      SizedBox( height: 30),

                    isLoading?Center(
                      child: LinearProgressIndicator(),
                    ) : greenButton('Register',(){

                      if(selectedImage==null){
                        Get.snackbar("warning", "svp veillez choisir une image");
                      }
                        setState(() {

                          isLoading=true;
                        });
                        storeUserInfo();


                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  uploadImage(File image)async{
    String imageUrl='';
    String fileName=Path.basename(image.path);
    var reference=FirebaseStorage.instance
        .ref()
        .child('users/$fileName');
    UploadTask uploadTask=reference.putFile(image);
    TaskSnapshot taskSnapshot= await uploadTask.whenComplete(() => null);
    await taskSnapshot.ref.getDownloadURL().then(
            (value) {
      imageUrl=value;
      print("Download URL:$value");

    },
    );
    return imageUrl;
  }

storeUserInfo()async{
    String url=await uploadImage(selectedImage!);
    String uid=FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection('users').doc(uid).set({
      'image':url,
      'nom':nameController.text,
      'prenom':homeController.text,
      'adresse':businessController.text,


    }).then((value){
        nameController.clear();
        homeController.clear();
        businessController.clear();



      setState(() {
        isLoading=false;
      });
      Get.to(()=>NavBar());

    });
}
bool isLoading=false;
@override
  TextFieldWidget(
      String title, IconData iconData, TextEditingController controller,Function validator) {
    //Function validator,{Function? onTap,bool readOnly = false}
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xffA7A7A7)),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          width: Get.width,
          // height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 1)
              ],
              borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
            //vallidate imput
            //appel de la function validator passer en parametre
            validator:(input)=>validator(input),
            controller: controller,
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xffA7A7A7)),
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  iconData,
                  color: AppColors.greenColor,
                ),
              ),
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }

  Widget greenButton(String title, Function onPressed) {
    return MaterialButton(
      minWidth: Get.width,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: appcolor,
      onPressed: () => onPressed(),
      child: Text(
        title,
        style: GoogleFonts.poppins(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }



}
