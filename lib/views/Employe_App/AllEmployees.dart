import 'package:alrazi_project/Themes/Theme.dart';
import 'package:alrazi_project/controllers/employee/AllEmployeeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
final AllEmployeeController controller = Get.put(AllEmployeeController());

class AllEmployees extends StatelessWidget {

  AllEmployeeController controller = Get.put(AllEmployeeController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator()
              .reactive(),
        );
      }
      if(controller.employeeList.isEmpty)
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
                        image: AssetImage('images/no.png'),
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
     return SingleChildScrollView(
        physics: ScrollPhysics(),

        child: Column(
          children: [
            SizedBox(height: 20,) ,
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 35,
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
                    child: Text(value),
                    value: value,
                  ))
                      .toList(),
                  onChanged: ( value) {
                    controller.set_selected(value) ;
                    if(controller.selected == 'الأكثر نقاطاً')
                      {
                        controller.order_by_points();
                      }
                    else{
                      controller.order_by_tasks();
                    }
                  },
                  isExpanded: false,
                  value: controller.selected,
                  hint: Text("فلترة" , style: TextStyle(fontSize: 14),),
                  borderRadius: BorderRadius.circular(30),
                  icon: Icon(Icons.menu),
                  autofocus: false ,
                  iconSize: 20,

                ),
              ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.employeeList.length,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        ListTile(
                            onTap: () {},
                            subtitle: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("${controller.employeeList.elementAt(i).name}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black87)),
                                      Text("( ${controller.employeeList.elementAt(i).task_count} مهمة)")
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${controller.employeeList.elementAt(i).points} ",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Themes.orange,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            title: Container(
                              margin: EdgeInsets.all(10),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey.shade500,
                                radius: 100,
                                backgroundImage: AssetImage('images/5.png'),
                              ),
                            )),
                        Divider()
                      ],
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }
}

