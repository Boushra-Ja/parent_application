
import 'package:alrazi_project/models/Advice.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../main.dart';

class AdvicePageController extends GetxController{

  List<Advice> AdviceList = <Advice>[].obs ;
  var isLoading = true.obs ;
  final storage = const FlutterSecureStorage();


  @override
  void onInit() {
    super.onInit();

    fetchMyAdvice() ;
  }


  Future<void>fetchMyAdvice()async{
    var child_id = await storage.read(key: 'id') ;

    final response = await http.get(Uri.parse('${MyApp.api}/api/advice/child/${child_id}')) ;

    if(response.statusCode == 200)
    {

      AdviceModel adviceModel = AdviceModel.fromJson(jsonDecode(response.body)) ;
      AdviceList.assignAll(adviceModel.data );

      isLoading.value = false;
    }else{
      print("errorrrrr") ;
    }
  }


}