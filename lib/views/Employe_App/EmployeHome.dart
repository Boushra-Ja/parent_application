import 'package:alrazi_project/Themes/Theme.dart';
import 'package:alrazi_project/controllers/HomeController.dart';
import 'package:alrazi_project/views/Employe_App/AllEmployees.dart';
import 'package:alrazi_project/views/Employe_App/NotificationPages/NotificationPage.dart';
import 'package:alrazi_project/views/WelcomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../controllers/Notification/SingltoneNotification.dart';
import 'MyTask.dart';

class EmployeHome extends GetView<HomeController> {
  final sampleController1 = Get.put(HomeController());
  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    EmpSingltoneNotification not_controller = Get.put(EmpSingltoneNotification()) ;

    return Directionality(
        textDirection: TextDirection.rtl,
        child: DefaultTabController(
          length: 2,
          child: FutureBuilder(
            future: Future.delayed(Duration(seconds: 1)),
    builder: (context, snapshot) {
      return Scaffold(
        backgroundColor: Themes.white,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: IconButton(
                icon: Icon(
                  Icons.notifications_active,
                  color: Colors.yellow,
                ),
                onPressed: () {
                  Get.to(NotificationPage());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: IconButton(
                icon: Icon(
                  Icons.logout_outlined,
                  color: Colors.yellow,
                ),
                onPressed: () async {
                  Get.dialog(
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Material(
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 10),
                                        Text(
                                          "تسجيل الخروج",
                                          style: Themes.headline2,
                                          textAlign: TextAlign.center,

                                        ),
                                        Divider() ,
                                        const SizedBox(height: 15),
                                        const Text(
                                          "هل أنت متأكد من رغبتك في تسجيل الخروج ؟",
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 20),
                                        SizedBox(height: 20,) ,
                                        Row(
                                          children: [
                                            Expanded(
                                              child: ElevatedButton(
                                                child: const Text(
                                                  'تأكيد',
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  minimumSize: const Size(0, 45),
                                                  primary: Themes.primary,
                                                  onPrimary: const Color(0xFFFFFFFF),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                ),
                                                onPressed: () async{
                                                  await storage.deleteAll();
                                                //  not_controller.logout() ;
                                                  Get.off(WelcomePage());
                                                },
                                              ),
                                            ),
                                            const SizedBox(width: 10),

                                            Expanded(
                                              child: ElevatedButton(
                                                child:  Text(
                                                  'ليس بعد',style: Themes.bodyline1,
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  minimumSize: const Size(0, 45),
                                                  primary: Themes.orange2,
                                                  onPrimary: const Color(0xFFFFFFFF),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Get.back() ;
                                                },
                                              ),
                                            ),

                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  );


                },
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: new Size(120.0, 120.0),
            child: TabBar(
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), // Creates border
                  color: Themes.secondary.withOpacity(0.7)),
              tabs: const [
                Tab(
                  text: "مهامي",
                ),
                Tab(text: "الموظفين")
              ],
            ),
          ),
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(top: 25,),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Themes.secondary.withOpacity(0.7),
                  child: Icon(Icons.person, color: Colors.white,),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(sampleController1.name != null ? sampleController1.name : '')
              ],
            ),
          ),

          backgroundColor: Themes.primary,
        ),
        body: TabBarView(
          children: [
            MyTask(),
            AllEmployees(),
          ],
        ),
      );
    }
          ),
        ));
  }
}
