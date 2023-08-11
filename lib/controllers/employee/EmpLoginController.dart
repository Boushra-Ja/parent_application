import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../Themes/Theme.dart';
import '../../main.dart';

class EmpLoginController extends GetxController{
  final storage = const FlutterSecureStorage();
  var isLoading = false.obs;
  var unique_number = null;
  final  loginFormkey = GlobalKey<FormState>() ;


  @override
  void onInit() {

    super.onInit();
  }

  void save_unique_key()async{
    bool isvalidate = loginFormkey.currentState!.validate();

    if (isvalidate) {
      isLoading.value = true;
      loginFormkey.currentState!.save();

      bool c = await is_found_unique_number() ;
      if(c)
      {
      }
    }

  }

  void dispose() {

    super.dispose();
  }



  Future<bool>  is_found_unique_number()async{
    var response = await http.post(Uri.parse('${MyApp.api}/api/is_found_unique_number'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            <String, dynamic>{"unique_number": unique_number}));

    if(response.statusCode == 200)
    {

      if(response.body.trim() == '0')
      {
        Get.snackbar( '' ,'' ,titleText: Text(
          'خطأ في المعلومات', // Arabic text for message body
          textDirection: TextDirection.rtl, // Set text direction to right-to-left
          textAlign: TextAlign.right,
          style: Themes.headline,// Set text alignment to right
        ),
            messageText: Text(
              'هذا الرقم غير مستخدم مسبقاً..', // Arabic text for message body
              textDirection: TextDirection.rtl, // Set text direction to right-to-left
              textAlign: TextAlign.right,
              style: Themes.headline2,// Set text alignment to right
            ),  backgroundColor: Themes.grey ,snackPosition: SnackPosition.BOTTOM);        return false ;
      }

    }
    return true ;

  }

}