import 'package:alrazi_project/models/TaskPoint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Themes/Theme.dart';
import '../../../models/Task.dart';

class BounsNotificationPage extends StatelessWidget{

  Task task ;
  TaskPoint taskPoint ;
  BounsNotificationPage({required this.task, required this.taskPoint}) ;
  //BounsController controller = Get.put(BounsController()) ;


  @override
  Widget build(BuildContext context) {
    var timeInDecimal = task.start_double.toInt() + task.deliver_date ;
    int hours = task.start_double.toInt() + task.deliver_date; // الساعات
    int minutes = ((timeInDecimal - hours) * 60).toInt(); // الدقائق
    int seconds = ((timeInDecimal - hours - (minutes / 60)) * 3600).toInt();
    String timeString = "$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(

      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "مهمة ${task.title}",
              style: Themes.headline,
            ),
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height + 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Card(
                elevation: 8,
                shadowColor: Themes.primary,
                shape: Border(
                    right: BorderSide(color: Themes.primary, width: 8)),
                margin: EdgeInsets.symmetric(horizontal: 15),
                color: Themes.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: Text(
                            "تفاصيل المهمة",
                            style: Themes.headline2,
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("اسم الطفل : ${task.child_name}"),
                      SizedBox(
                        height: 20,
                      ),
                      Text("عنوان المهمة : ${task.title}"),
                      SizedBox(
                        height: 20,
                      ),
                      Text("التفاصيل :${task.description}"),
                      SizedBox(
                        height: 20,
                      ),
                      Text("تاريخ المهمة : ${task.task_date}"),
                      SizedBox(
                        height: 20,
                      ),
                      Text("تبدأ المهمة في الساعة : ${task.start} "),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          "الوقت المتوقع للإنجاز في الساعة : ${timeString}"),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 20),
                          child: Text('تم اسناد نقاط لهذه المهمة من قبل المدير عددها  ${taskPoint.points} نقطة.....'),
                        ),
                        decoration:   BoxDecoration(
                          color: Themes.grey,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),

                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child:
                            Container(
                              height:
                              MediaQuery.of(context).size.height * 0.4,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/bouns.jpg'),
                                    fit: BoxFit.contain),
                              ),
                            ),

                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    ));
  }
}
