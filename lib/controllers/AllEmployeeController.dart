
import 'package:alrazi_project/models/Employee.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../main.dart';
class AllEmployeeController extends GetxController{

  var selected ;
  List<String> filter  = ['الأكثر نقاطاً'  , 'الأكثر مهاماً'] ;

  List<Employee> employeeList = <Employee>[].obs ;
  var isLoading = true.obs ;

  @override
  void onInit() {
    super.onInit();
    fetchAllEmplyees() ;
  }

  Future<void>fetchAllEmplyees()async{
    final response = await http.get(Uri.parse('${MyApp.api}/api/Employees/all')) ;

    if(response.statusCode == 200)
    {

      EmployeeModel shopModel = EmployeeModel.fromJson(jsonDecode(response.body)) ;
      employeeList.assignAll(shopModel.data );

      isLoading.value = false;

    }else{
      print("errorrrrr") ;
    }
  }

  void set_selected(var s)
  {
    this.selected = s ;
    update() ;
  }

  Future<void>order_by_points()async{
    final response = await http.get(Uri.parse('${MyApp.api}/api/Employees/order/points')) ;

    if(response.statusCode == 200)
    {

      EmployeeModel shopModel = EmployeeModel.fromJson(jsonDecode(response.body)) ;
      employeeList.assignAll(shopModel.data );

      isLoading.value = false;

    }else{
      print("errorrrrr") ;
    }
  }

  Future<void>order_by_tasks()async{
    final response = await http.get(Uri.parse('${MyApp.api}/api/Employees/order/tasks')) ;

    if(response.statusCode == 200)
    {

      EmployeeModel shopModel = EmployeeModel.fromJson(jsonDecode(response.body)) ;
      employeeList.assignAll(shopModel.data );

      isLoading.value = false;

    }else{
      print("errorrrrr") ;
    }
  }


}