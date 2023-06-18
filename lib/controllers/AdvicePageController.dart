
import 'package:alrazi_project/models/Advice.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../main.dart';

class AdvicePageController extends GetxController{

  List<Advice> AdviceList = <Advice>[].obs ;
  var isLoading = true.obs ;
  var child_id = 3;

  @override
  void onInit() {
    super.onInit();
    fetchMyAdvice(child_id) ;
  }


  Future<void>fetchMyAdvice(var child_id)async{
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