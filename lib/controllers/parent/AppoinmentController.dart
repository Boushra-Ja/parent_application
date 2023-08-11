
import 'dart:convert';
import 'package:alrazi_project/models/Appoinment.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';

class AppoinmentController extends GetxController{

  List<Appoinment> appoimentslist = <Appoinment>[].obs ;
  var isLoading = true.obs ;
  final storage = const FlutterSecureStorage();


  @override
  void onInit() {
    super.onInit();

    fetchMyAppoinments() ;
  }


  Future<void>fetchMyAppoinments()async{
    var child_id = await storage.read(key: 'id') ;

    final response = await http.get(Uri.parse('${MyApp.api}/api/child/appoinments/${child_id}')) ;

    if(response.statusCode == 200)
    {

      AppoinmentModel appoinmentModel = AppoinmentModel.fromJson(jsonDecode(response.body)) ;
      appoimentslist.assignAll(appoinmentModel.data );

      isLoading.value = false;
    }else{
      print("errorrrrr") ;
    }
  }


}