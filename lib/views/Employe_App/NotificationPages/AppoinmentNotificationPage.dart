import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Themes/Theme.dart';
import 'BounsNotificationPage.dart';

class AppoinmentNotificationPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
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

              Text("Apppppppppppppp") ,
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