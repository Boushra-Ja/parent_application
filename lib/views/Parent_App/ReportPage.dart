import 'package:alrazi_project/Themes/Theme.dart';
import 'package:alrazi_project/controllers/parent/ReportPageController.dart';
import 'package:alrazi_project/views/Parent_App/MyChartWidget.dart';
import 'package:alrazi_project/views/Parent_App/TestResultPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ReportPage extends StatelessWidget {
  ReportPageController controller = Get.put(ReportPageController()) ;
  @override
  Widget build(BuildContext context) {
      return RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            Duration(seconds: 3),
                () {
              controller.inital() ;
            },
          );
        },
        child: Obx((){

          if(!controller.isLoading.value)
          {
            return Center(
              child: CircularProgressIndicator(
                color: Themes.primary,
              ),
            );
          }
          return Container(
            color: Themes.white,
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Container(
                      decoration: new BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Themes.grey.withOpacity(0.6),
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(right: 10, left: 10, bottom: 15),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  'معلومات عن ${controller.name}',
                                  style: Themes.headline2,
                                ),
                              ),
                              Divider(),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "القسم :  ${controller.report.section}",
                                style: Themes.bodyline1,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "شدة الاصابة : ${controller.report.infection}",
                                style: Themes.bodyline1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                     Container(
                      decoration: new BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Themes.grey.withOpacity(0.6),
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(right: 10, left: 10, bottom: 15),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 30),
                            child: SingleChildScrollView(
                                physics: ScrollPhysics(),
                                child: Column(children: [

                                  Center(
                                    child: Text('اختبارات ${controller.name}' , style: Themes.headline2,),
                                  ),
                                  controller.check.value ? ListView.builder(
                                      itemCount: 1,
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, i) {
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Divider(),
                                            SizedBox(height: 10,) ,
                                            ListTile(
                                              contentPadding: EdgeInsets.symmetric(horizontal: 10 , vertical: 15),
                                              trailing: IconButton(icon : Icon(Icons.remove_red_eye , size: 20) , onPressed: (){
                                                Get.to(TestResultPaage(report:controller.report));
                                              },),
                                              title: Text("اختبار الصورة الجانبية" , style: Themes.headline2,),
                                              subtitle: Text("تاريخ الاختبار  ${controller.report.test_date}" , style: Themes.bodyline1,),
                                            ),
                                          ],
                                        );
                                      }): Center(
                                    child: Column(
                                      children: [
                                        SizedBox(height: 20,),
                                        Container(
                                          height:
                                          MediaQuery.of(context).size.height * 0.4,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage('images/empty.png'),
                                                fit: BoxFit.contain),
                                          ),
                                        ),
                                        Text(
                                          "لا يوجد اختبارات كاملة لهذا الطفل",
                                        )
                                      ],
                                    ),
                                  ),
                                ]))),
                      ),
                    )
                  ],
                )
              ],
            ),
          ) ;
        }),
      ) ;

  }
}

/*

 */
