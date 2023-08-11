import 'package:alrazi_project/Themes/Theme.dart';
import 'package:alrazi_project/controllers/HomeController.dart';
import 'package:alrazi_project/views/Employe_App/AllEmployees.dart';
import 'package:alrazi_project/views/Employe_App/NotificationPage.dart';
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
    Get.put(EmpSingltoneNotification()) ;

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
                  await storage.deleteAll();
                  Get.off(WelcomePage());
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
