import 'package:alrazi_project/Themes/Theme.dart';
import 'package:alrazi_project/models/Task.dart';
import 'package:flutter/material.dart';

class TaskDetail extends StatelessWidget {
  Task task;

  TaskDetail(this.task);

  @override
  Widget build(BuildContext context) {
    var timeInDecimal = task.start_double.toInt() + task.deliver_date;
    int hours = task.start_double.toInt() + task.deliver_date; // الساعات
    int minutes = ((timeInDecimal - hours) * 60).toInt(); // الدقائق
    int seconds = ((timeInDecimal - hours - (minutes / 60)) * 3600).toInt();
    String timeString =
        "$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Themes.orange2,
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
                height: MediaQuery.of(context).size.height,
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
                          Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('images/task_d.jpg'),
                                        fit: BoxFit.contain),
                                  ),
                                ),
                              ],
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
