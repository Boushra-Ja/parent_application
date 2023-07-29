import 'dart:convert';
import 'package:alrazi_project/views/Employe_App/EmployeHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

class PasswordController extends GetxController{
  final passwordFormkey = GlobalKey<FormState>();
  var isLoading = false.obs;
  var password = ''  , emp_id;
  final storage = const FlutterSecureStorage();

  void save()async{

    bool isvalidate = passwordFormkey.currentState!.validate();

    if (isvalidate) {
      passwordFormkey.currentState!.save();
      await setPassword() ;
    }

  }

  Future<void> setPassword()async{
    var response = await http.post(Uri.parse('${MyApp.api}/api/emp/setPassword'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            <String, dynamic>{"password": password, "emp_id": emp_id}));

    if (response.statusCode == 200){
      isLoading.value = true;
      Get.to(EmployeHome()) ;
    }
  }

  @override
  void onInit() {
    inital() ;
    super.onInit();
  }

  void inital()async{
    emp_id = await storage.read(key: 'id') ?? '';

  }
}