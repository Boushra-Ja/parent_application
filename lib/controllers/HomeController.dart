

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController{
  var name, id ;

  @override
  void onInit() {
    inital() ;
    super.onInit();

  }

  void inital()async{
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name') ?? '';
    print(name) ;
    id = prefs.getString('id') ?? '';
  }
}