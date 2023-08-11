import 'package:alrazi_project/Themes/Theme.dart';
import 'package:alrazi_project/views/Employe_App/NotificationPage.dart';
import 'package:alrazi_project/views/Parent_App/AdvicePage.dart';
import 'package:alrazi_project/views/Parent_App/ReportPage.dart';
import 'package:alrazi_project/views/WelcomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../../controllers/HomeController.dart';
import '../../controllers/Notification/SingltoneNotification.dart';
import 'AppoinmentPage.dart';

class FamilyHome extends GetView<HomeController> {
  final controller = Get.put(HomeController());
  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    Get.put(EmpSingltoneNotification()) ;

    return Directionality(
        textDirection: TextDirection.rtl,
        child: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) {
              return DefaultTabController(
                length: 3,
                child: FutureBuilder(
                    future: Future.delayed(Duration(seconds: 1)),
                    builder: (context, snapshot) {
                      return Scaffold(
                        appBar: AppBar(
                          flexibleSpace: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Themes.secondary,
                                Themes.secondary,
                              ],
                            )),
                          ),
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
                                onPressed: () async{
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
                                  borderRadius: BorderRadius.circular(50),
                                  // Creates border
                                  color: Themes.primary.withOpacity(0.6)),
                              tabs: const [
                                Tab(
                                  text: "تقارير",
                                ),
                                Tab(text: "توجيهات") ,
                                Tab(text: "مواعيد")
                              ],
                            ),
                          ),
                          automaticallyImplyLeading: false,
                          title: Padding(
                            padding: const EdgeInsets.only(
                              top: 25,
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Themes.primary.withOpacity(0.6),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(" الطفل" + '  ' + '${controller.name}')
                              ],
                            ),
                          ),
                          backgroundColor: Themes.secondary,
                        ),
                        body: TabBarView(
                          children: [ReportPage(), AdvicePage() , AppinmentPage()],
                        ),
                      );
                    }),
              );
            }));
  }
}
