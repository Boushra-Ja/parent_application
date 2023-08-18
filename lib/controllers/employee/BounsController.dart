import 'package:alrazi_project/views/Employe_App/NotificationPages/BounsNotificationPage.dart';
import 'package:get/get.dart';
import '../../main.dart';
import '../../models/TaskPoint.dart';
import 'package:http/http.dart' as http;

class BounsController extends GetxController{

  late TaskPointModel bouns ;

  static void  get_bouns_details()async{

    //Get.to(BounsNotificationPage()) ;
    final response =
        await http.get(Uri.parse('${MyApp.api}/api/details_ِbouns/1'));

    if(response.statusCode == 200)
      {
        TaskPointModel taskPointModel = tableFromJson2(response.body) ;
        print("ddddddddddddddddddddddd") ;
        print(taskPointModel.data.task_name) ;
      }
  }

  @override
  void onInit() {
    get_bouns_details() ;
    super.onInit();
  }



}