import 'dart:convert';
import 'package:alrazi_project/models/Employee.dart';
import 'package:alrazi_project/views/Employe_App/EmployeHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../Themes/Theme.dart';
import '../../main.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController{

  final emailFormkey = GlobalKey<FormState>();
  final passwordFormkey = GlobalKey<FormState>();
  late Employee employee ;
  var email , password ;
  final storage = const FlutterSecureStorage();
  var isLoading = false.obs ;

  Future<void>  login()async{

    bool isvalidate1 = emailFormkey.currentState!.validate();
    bool isvalidate2 = passwordFormkey.currentState!.validate();

    if (isvalidate1 && isvalidate2) {
      passwordFormkey.currentState!.save();
      emailFormkey.currentState!.save();

      isLoading.value = true;

      var response = await http.post(Uri.parse('${MyApp.api}/api/emp/login'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(
              <String, dynamic>{"email": email , 'password' : password , 'role' :'Employee'}));

      if(response.statusCode == 200)
      {

        EmployeeModel employeeModel = tableFromJson(response.body);

        employee = new Employee(
            id: employeeModel.data.id,
            name: employeeModel.data.name,
            unique_number: employeeModel.data.unique_number,
            points: employeeModel.data.points,
            task_count: employeeModel.data.task_count ,password: employeeModel.data.password , email: employeeModel.data.email);


        await store_in_storage() ;
        var id = storage.read(key: 'id') ;
        print('***********************');
        print(id ) ;
        print('***********************');

        isLoading.value = false;
        Get.to(EmployeHome()) ;
      }
      else{
        Get.snackbar( '' ,'' ,titleText: Text(
          'خطأ في المعلومات', // Arabic text for message body
          textDirection: TextDirection.rtl, // Set text direction to right-to-left
          textAlign: TextAlign.right,
          style: Themes.headline,// Set text alignment to right
        ),
            messageText: Text(
              'يرجى التحقق من الايميل ومن كلمة المرور..', // Arabic text for message body
              textDirection: TextDirection.rtl, // Set text direction to right-to-left
              textAlign: TextAlign.right,
              style: Themes.headline2,// Set text alignment to right
            ),  backgroundColor: Themes.grey ,snackPosition: SnackPosition.BOTTOM);
      }

    }

  }

  Future<void> store_in_storage()async{

    await storage.write(key: "name", value: '${employee.name}');
    await storage.write(key: "id", value: '${employee.id}');
    await storage.write(key: "points", value: '${employee.points}');
    await storage.write(key: "task_count", value: '${employee.task_count}');
    await storage.write(key: "islogin", value: 'true');
    await storage.write(key: "role", value: 'employee');
    await storage.write(key: "password", value: '${password}');


  }

}