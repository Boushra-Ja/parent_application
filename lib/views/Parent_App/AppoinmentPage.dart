
import 'package:alrazi_project/controllers/parent/AppoinmentController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Themes/Theme.dart';

class AppinmentPage extends StatelessWidget{

  AppoinmentController controller = Get.put(AppoinmentController()) ;

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: Themes.white,
            body: RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(
                    Duration(seconds: 2),
                        () {
                      controller.fetchMyAppoinments()     ;

                    },
                  );
                },
                child: Obx((){
                  if (controller.appoimentslist.isEmpty) {
                    return Center(
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
                            "لا يوجد مواعيد متاحة",
                          )
                        ],
                      ),
                    );
                  }
                  return SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            height: 35,
                            width: MediaQuery.of(context).size.width * 0.4,
                            margin: EdgeInsets.only(left: 10),
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                  color: Colors.grey, style: BorderStyle.solid, width: 0.80),
                            ),

                            child: DropdownButton(

                              items: controller.filter
                                  .map((value) => DropdownMenuItem(
                                child: Text(value , textDirection: TextDirection.rtl,),
                                value: value,
                              ))
                                  .toList(),
                              onChanged: (value) {
                                controller.set_selected(value) ;
                                controller.update_data();

                              },
                              isExpanded: false,
                              value: controller.selected,
                              borderRadius: BorderRadius.circular(20),
                              icon: Icon(Icons.menu),
                              autofocus: false ,
                              iconSize: 20,

                            ),
                          ),
                        ),

                        ListView.builder(
                            itemCount: controller.appoimentslist.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, i) {
                              return Container(
                                margin: EdgeInsets.only(right: 15, left: 15, top: 15),
                                height: MediaQuery.of(context).size.height * 0.2,
                                child: Material(
                                  elevation: 2.0,
                                  shadowColor: Colors.grey ,
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: InkWell(
                                    onTap: () {
                                    },
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                        side: BorderSide(color: Colors.grey.shade100, width: 2),
                                      ),
                                      selected: true,
                                      selectedTileColor: Themes.white,
                                      contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 10),

                                      title: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "الموعد ${i+1}",
                                            style: Themes.headline2,
                                          ),

                                        ],
                                      ),
                                      subtitle: Text(
                                        "تم إعطاء موعد لطفلكم وذلك بتاريخ ${controller.appoimentslist.elementAt(i).app_date} ، وذلك في تمام الساعة ${controller.appoimentslist.elementAt(i).start_app}   ",
                                        style: Themes.bodyline1,
                                      ),
                                      trailing:  Wrap(
                                        spacing: 6, // space between two icons
                                        children: <Widget>[
                                          IconButton(icon : Icon(Icons.remove_red_eye) , color: Themes.primary,onPressed: (){

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
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  const SizedBox(height: 10),
                                                                  Center(
                                                                    child: Text(
                                                                      "الموعد ${i+1}",
                                                                      style: Themes.headline2,
                                                                      textAlign: TextAlign.center,

                                                                    ),
                                                                  ),
                                                                  Divider() ,
                                                                  const SizedBox(height: 15),
                                                                  Text(
                                                                    "- تم إعطاء موعد لطفلكم وذلك بتاريخ ${controller.appoimentslist.elementAt(i).app_date}  ",
                                                                    style: Themes.bodyline1,
                                                                  ),
                                                                  const SizedBox(height: 8),
                                                                  Text(" - وذلك في تمام الساعة  ${controller.appoimentslist.elementAt(i).start_app}" ,style: Themes.bodyline1, ),
                                                                  const SizedBox(height: 20),
                                                                  Text(
                                                                    "- الرجاء عدم التأخر عن الموعد والحضور في الوقت المحدد..",
                                                                    style: Themes.bodyline1,
                                                                  ),
                                                                  const SizedBox(height: 8),
                                                                  Text(
                                                                    "- مدة الموعد ${controller.appoimentslist.elementAt(i).hours} ساعة ..",
                                                                    style: Themes.bodyline1,
                                                                  ),
                                                                  SizedBox(height: 20,) ,
                                                                  Row(
                                                                    children: [
                                                                      Expanded(
                                                                        child: ElevatedButton(
                                                                          child: const Text(
                                                                            'إغلاق',
                                                                          ),
                                                                          style: ElevatedButton.styleFrom(
                                                                            minimumSize: const Size(0, 45),
                                                                            primary: Themes.secondary,
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
                                                                      const SizedBox(width: 10),


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

                                          },), // icon-1
                                        ],
                                      ),

                                    ),
                                  ),
                                ),
                              );
                            }),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  );

                }))));
  }
}