

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController{
  var name, id  ;
  final storage = const FlutterSecureStorage();

  @override
  void onInit() {
    inital() ;
    super.onInit();

  }

  void inital()async{
    name = await storage.read(key: 'name') ?? '';
    id = await storage.read(key: 'id') ?? '';

  }
}