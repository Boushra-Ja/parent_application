import 'package:alrazi_project/models/TableResault.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';

class ReportPageController extends GetxController {
  var name, id, user_type, var1, var2;
  var isLoading = false.obs;
  final storage = const FlutterSecureStorage();
  late ReportModel report ;
  var check = true.obs ;

  @override
  void onInit() {
    inital();
    super.onInit();
  }

  void inital() async {
    name =await storage.read(key: 'name') ?? '';
    id = await storage.read(key: 'id') ?? '';
    user_type = await storage.read(key: 'role') ?? '';
    if (user_type == 'child') {
      var1 = await storage.read(key: 'infection')?? '';
      var2 = await storage.read(key: 'section') ?? '';
    }
    else {
      var1 = await storage.read(key: 'points')  ?? '';
      var2 =  await storage.read(key: 'tasks_count')  ?? '';
    }
   await get_tests();
  }

  Future<void> get_tests() async {
    final response = await http.get(
        Uri.parse('${MyApp.api}/api/child/test/${id}'));

    if (response.statusCode == 200) {


      if(response.body.trim() == '"-1"')
        {
          check.value = false ;
          isLoading.value = true;

        }
      else{
        var stringObject = response.body;
        report = tableFromJson(stringObject);

        isLoading.value = true;
      }

    }
    else
      {
        print('errorr') ;
      }
  }

}