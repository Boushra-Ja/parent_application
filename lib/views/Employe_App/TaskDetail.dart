
import 'package:alrazi_project/Themes/Theme.dart';
import 'package:alrazi_project/models/Task.dart';
import 'package:flutter/material.dart';

class TaskDetail extends StatelessWidget{
  Task task ;
  TaskDetail(this.task) ;

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(

      body: ListView(
        children: [
          SizedBox(height: 50,) ,
          Center(child: Text("المهمة ${task.num}" , style: Themes.headline,), ),
          SizedBox(height: 20,) ,
          Divider(),
          SizedBox(height: 10,) ,
          Container(

            height: MediaQuery.of(context).size.height,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Card(
                elevation: 8,
                shadowColor: Themes.primary,

                shape: Border(right: BorderSide(color: Themes.primary, width: 8)),

                margin: EdgeInsets.symmetric(horizontal: 15),
                color: Themes.orange2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(height: 20,) ,
                      Center(child: Text("تفاصيل المهمة" , style: Themes.headline2,)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(),
                      ),
                      SizedBox(height: 20,) ,
                      Text("اسم الطفل : ${task.child_name}"),
                      SizedBox(height: 20,) ,
                      Text("عنوان المهمة : ${task.title}"),
                      SizedBox(height: 20,) ,
                      Text("التفاصيل :${task.description}"),
                      SizedBox(height: 20,) ,
                      Text("تاريخ استلام المهمة : ${task.task_date}"),
                      SizedBox(height: 20,) ,
                      Text("التاريخ المتوقع للتسليم : ${task.deliver_date}"),
                      SizedBox(height: 20,) ,

                    ],
                  ),
                ),

              ),
            ),
          ),
          SizedBox(height: 30,)


        ],
      ),
    ));
  }
}