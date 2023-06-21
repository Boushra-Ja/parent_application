
import 'package:alrazi_project/Themes/Theme.dart';
import 'package:alrazi_project/controllers/MyTaskController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'TaskDetail.dart';

class MyTask extends StatelessWidget{

  MyTaskController controller = Get.put(MyTaskController()) ;

  @override
  Widget build(BuildContext context) {
    return Obx(() {

      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator()
              .reactive(),
        );
      }
      if(controller.taskList.isEmpty)
        {
          return Center(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Container(
                  height:
                  MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/task.png'),
                        fit: BoxFit.contain),
                  ),
                ),
                Text(
                  "لا يوجد مهام متاحة",
                )
              ],
            ),
          );
        }
      return   ListView.builder(
          itemCount: controller.taskList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(right: 15, left: 15, top: 15),
              height: MediaQuery.of(context).size.height * 0.2,
              child: Material(
                elevation: 2.0,
                shadowColor: Colors.grey ,
                borderRadius: BorderRadius.circular(20.0),
                child: InkWell(
                  onTap: () {
                    Get.to(TaskDetail(controller.taskList.elementAt(index)) ) ;
                  },
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.grey.shade100, width: 2),
                    ),
                    selected: true,
                    selectedTileColor: Themes.orange2,
                    contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 10),

                    title: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "المهمة ${controller.taskList.elementAt(index).num}",
                          style: Themes.headline2,
                        ),
                        // Text(
                        //   "يببببب"
                        // )
                      ],
                    ),
                    subtitle: Text(
                        "${controller.taskList.elementAt(index).task_date}",
                      style: Themes.bodyline1,
                    ),
                    trailing:  Wrap(
                      spacing: 6, // space between two icons
                      children: <Widget>[
                        IconButton(icon : Icon(Icons.details) , color: Themes.blue,onPressed: (){
                          Get.to(TaskDetail(controller.taskList.elementAt(index))) ;
                        },), // icon-1
                        IconButton(icon:Icon(Icons.terminal) , color: Themes.blue, onPressed: (){
                          Get.dialog(
                            Column(
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
                                              "إنهاء المهمة",
                                              style: Themes.headline2,
                                              textAlign: TextAlign.center,

                                            ),
                                            Divider() ,
                                            const SizedBox(height: 15),
                                            const Text(
                                              "هل أنت متأكد من إنجازك للمهمة 1 ؟",
                                              textAlign: TextAlign.center,
                                            ),
                                            const SizedBox(height: 20),
                                            //Buttons
                                            Row(
                                              children: [
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
                                                const SizedBox(width: 10),
                                                Expanded(
                                                  child: ElevatedButton(
                                                    child: const Text(
                                                      'تأكيد',
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
                                                      controller.terminate_task(controller.taskList.elementAt(index).num , index) ;
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
                          );
                        },), // icon-2
                        //SizedBox(width: 2,)
                      ],
                    ),

                  ),
                ),
              ),
            );
          });
    }
    );

  }


}
