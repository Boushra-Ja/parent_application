import 'package:alrazi_project/Themes/Theme.dart';
import 'package:alrazi_project/views/Employe_App/NotificationPage.dart';
import 'package:alrazi_project/views/Parent_App/AdvicePage.dart';
import 'package:alrazi_project/views/Parent_App/ReportPage.dart';
import 'package:alrazi_project/views/WelcomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/HomeController.dart';

class FamilyHome extends GetView<HomeController> {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: GetBuilder<HomeController>(
            init: HomeController(), builder: (controller) {
              return DefaultTabController(
                length: 2,
                child: Scaffold(
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
                          )
                      ),
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
                            Get.to(NotificationPage()) ;
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
                          onPressed: () {
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
                            color: Themes.blue),
                        tabs: const [
                          Tab(
                            text: "تقارير",
                          ),
                          Tab(text: "توجيهات")
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
                            backgroundColor: Themes.blue,
                            child: Icon(Icons.person , color: Colors.white,),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(" الطفل" + '  ' + '${controller.name}')
                        ],
                      ),
                    ),

                    backgroundColor: Themes.orange,

                  ),
                  body: TabBarView(
                    children: [
                      ReportPage(),
                      AdvicePage()
                    ],
                  ),
                ),
              );
        }));
  }
}