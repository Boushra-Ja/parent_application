import 'package:alrazi_project/Themes/Theme.dart';
import 'package:alrazi_project/controllers/ReportPageController.dart';
import 'package:alrazi_project/views/Parent_App/MyChartWidget.dart';
import 'package:alrazi_project/views/Parent_App/TestResultPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportPage extends StatelessWidget {
  ReportPageController controller = Get.put(ReportPageController()) ;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportPageController>(
      init: ReportPageController(),
        builder: (controller){
      return Container(
        color: Themes.orange2,
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
                        color: Themes.grey,
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
                            "الحالة :  ${controller.var1}",
                            style: Themes.bodyline1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "شدة الاصابة : ${controller.var2}",
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
                        color: Themes.grey,
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
                              ListView.builder(
                                  itemCount: 5,
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
                                            Get.to(TestResultPaage());
                                          },),
                                          title: Text("اختبار الصورة الجانبية" , style: Themes.headline2,),
                                          subtitle: Text("تاريخ الاختبار  12/2/2022" , style: Themes.bodyline1,),
                                        ),
                                      ],
                                    );
                                  })
                            ]))),
                  ),
                ),
              ],
            )
          ],
        ),
      ) ;
    });
  }
}

/*

 */
