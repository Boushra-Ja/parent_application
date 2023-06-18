
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReportPageController extends GetxController{
  var name, id , user_type , var1 , var2 ;

  @override
  void onInit() {
    inital() ;
    super.onInit();

  }

  void inital()async {
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name') ?? '';
    print(name);
    id = prefs.getString('id') ?? '';
    user_type = prefs.getString('type') ?? '';
    if (user_type == '1') {
      var1 = prefs.getString('infection') ?? '';
      var2 = prefs.getString('section') ?? '';
    }
    else {
      var1 = prefs.getString('points') ?? '';
      var2 = prefs.getString('tasks_count') ?? '';
    }
  }

}