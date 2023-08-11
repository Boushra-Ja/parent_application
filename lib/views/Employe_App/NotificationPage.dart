import 'package:alrazi_project/Themes/Theme.dart';
import 'package:alrazi_project/controllers/Notification/NotificationController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends StatelessWidget {

  NotificationController controller = Get.put(NotificationController()) ;

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: RoundedAppBar(controller.rule.trim()),
            backgroundColor: controller.notifications.isEmpty ? Themes.white : Themes.orange2,
            body:  Obx(
                (){
                  if(!controller.isLoading.value)
                    {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Themes.primary,
                        ),
                      );
                    }

                  if (controller.notifications.isEmpty) {
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
                            "لا يوجد اشعارات متوفرة",
                          )
                        ],
                      ),
                    );
                  }
                  return  ListView.builder(
                      itemCount: controller.notifications.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10, bottom: 15),
                          child: InkWell(
                            onTap: () {

                            },
                            child: ListTile(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                selected: true,
                                contentPadding: EdgeInsets.all(20),
                                selectedTileColor: Colors.white,
                                leading: CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Themes.secondary,
                                  child: Icon(Icons.abc),
                                ),
                                trailing: Text(
                                  controller.notifications.elementAt(index).created_at,
                                  style: Themes.bodyline1,
                                ),
                                title: Text(
                                  controller.notifications.elementAt(index).title,
                                  style: Themes.headline2,
                                ),
                                subtitle: Text(
                                  controller.notifications.elementAt(index).message,
                                  style: Themes.bodyline1,
                                )),
                          ),
                        );
                      }) ;
                }
            )
        ));
              }

  }




class RoundedAppBar extends StatelessWidget implements PreferredSizeWidget {

  final rule ;
  RoundedAppBar(this.rule) ;
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        new SizedBox.fromSize(
          size: preferredSize,
          child: new LayoutBuilder(builder: (context, constraint) {
            final width = constraint.maxWidth * 9;
            return new ClipRect(
              child: new OverflowBox(
                maxHeight: double.infinity,
                maxWidth: double.infinity,
                child: new SizedBox(
                  width: width,
                  height: width - 40,
                  child: new Padding(
                    padding: new EdgeInsets.only(
                        bottom: width / 2 - preferredSize.height / 2),
                    child: new DecoratedBox(
                      decoration: new BoxDecoration(
                        color: rule == 'employee' ? Themes.primary : Themes.secondary,
                        shape: BoxShape.circle,
                        boxShadow: [
                          new BoxShadow(color: Colors.black54, blurRadius: 10.0)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 15.0, top: 20),
            child: Align(
                child: CircleAvatar(
                  radius: 20,
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color:
                    Themes.secondary,
                  ),
                  backgroundColor: Colors.grey.shade200,
                ),
                alignment: Alignment.topRight),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}


