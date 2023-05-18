import 'package:get/get.dart';
class SierGeController extends GetxController{
  static SierGeController get instance=>Get.find();
  var indexGerbon=0.obs;
//  var indexKusi=0.obs;
  void gantiGerbon(int indexGerbonTerpilih){
     indexGerbon.value=indexGerbonTerpilih;
     gerbon.refresh();

  }
  void reset(){
    gerbon[indexGerbon.value].forEach((element) {
      if(element["status"]!="filled"){
        element.update("status", (value) =>"avialable");
      }
    });
  }
  void SelectPlace(int indexdataPlace){
    //indexKusi.value=indexdataPlace;

 // gerbon.refresh();
    print(gerbon[indexGerbon.value][indexdataPlace]);

    if(gerbon[indexGerbon.value][indexdataPlace]["status"]=="avialable"){
      reset();
      gerbon[indexGerbon.value][indexdataPlace].update("status", (value) => "selected");
    }
gerbon.refresh();
  }

  var gerbon=List.generate(
      6, (indexG) =>List<Map<String,dynamic>>.generate(75,
              (indexP){
            if(indexG==0){

              if(indexP >=25 && indexP<=26||indexP >=40 && indexP<=44 ){
                return{
                  "id":"ID-${indexG+1}-${indexP +1}",
                  "status":"filled",
                };
              }
              else{
                return{
                  "id":"ID-${indexG+1}-${indexP +1}",
                  "status":"avialable",
                };
              }
            }else if(indexG ==1){
              if(indexP >=5 && indexP<=35){
                return{
                  "id":"ID-${indexG+1}-${indexP +1}",
                  "status":"filled",
                };
              }
              else{
                return{
                  "id":"ID-${indexG+1}-${indexP +1}",
                  "status":"avialable",
                };
              }
            }else{
              return{
                "id":"ID-${indexG+1}-${indexP +1}",
                "status":"avialable",
              };
            }
            },

  ),

  ).obs;
}