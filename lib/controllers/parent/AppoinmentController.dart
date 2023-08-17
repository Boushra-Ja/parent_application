
import 'dart:convert';
import 'package:alrazi_project/models/Appoinment.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';

class AppoinmentController extends GetxController{
  List<String> filter  = ['المنجزة' , 'غير المنجزة'] ;
  var selected = 'المنجزة' ;
  List<Appoinment> appoimentslist = <Appoinment>[].obs ;
  var isLoading = true.obs ;
  final storage = const FlutterSecureStorage();
  List<Appoinment> finishlist = <Appoinment>[].obs ;
  List<Appoinment> notfinishlist = <Appoinment>[].obs ;


  @override
  void onInit() {
    super.onInit();

    fetchMyAppoinments() ;
  }

  void set_selected(var s)
  {
    this.selected = s ;
    update() ;
  }
  Future<void>fetchMyAppoinments()async{
    var child_id = await storage.read(key: 'id') ;

    final response = await http.get(Uri.parse('${MyApp.api}/api/child/appoinments/${child_id}')) ;

    if(response.statusCode == 200)
    {

      AppoinmentModel appoinmentModel = AppoinmentModel.fromJson(jsonDecode(response.body)) ;
      appoimentslist.assignAll(appoinmentModel.data );

      for(int i =0 ; i< appoimentslist.length ;i++)
        {
          if(appoimentslist.elementAt(i).check == 0)
            {

              notfinishlist.add(appoimentslist.elementAt(i));
            }
          else if(appoimentslist.elementAt(i).check == 1)
            {
              finishlist.add(appoimentslist.elementAt(i));
            }

        }
      appoimentslist.assignAll(finishlist) ;

      isLoading.value = false;
    }else{
      print("errorrrrr") ;
    }
  }

  void update_data(){
    if(selected == 'المنجزة')
      {
        appoimentslist.assignAll(finishlist) ;
      }
    else if(selected == 'غير المنجزة')
    {

      appoimentslist.assignAll(notfinishlist) ;
    }

  }

}