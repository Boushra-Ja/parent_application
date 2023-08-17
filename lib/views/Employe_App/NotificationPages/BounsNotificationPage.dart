import 'package:alrazi_project/controllers/employee/BounsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Themes/Theme.dart';

class BounsNotificationPage extends StatelessWidget{

  BounsController controller = Get.put(BounsController()) ;
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      appBar: RoundedAppBar(),
      backgroundColor: Themes.grey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Card(
          color: Themes.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50,) ,

              Text("Bounsssssssss") ,
              SizedBox(height: 10,) ,
              Text("ssssssssssssssssss") ,
              SizedBox(height: 10,) ,
              Text("ssssssssssssssssss") ,
              SizedBox(height: 50,) ,
            ],
          ),

        ),
      ),
    ));
  }

}


class RoundedAppBar extends StatelessWidget implements PreferredSizeWidget {

  //final sampleController3 = Get.put(SettingPageController(), permanent: true);


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
                        color: Themes.grey,
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
                    Themes.primary,
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


