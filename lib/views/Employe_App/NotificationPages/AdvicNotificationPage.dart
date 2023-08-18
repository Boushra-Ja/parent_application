import 'package:alrazi_project/models/Advice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../Themes/Theme.dart';
import 'BounsNotificationPage.dart';

class AdviceNotificationPage extends StatelessWidget {
  Advice advice;

  AdviceNotificationPage({required this.advice});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Themes.grey,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Center(
                          child: Text(
                            "تم إرسال التوجيه التالي من قبل المدير",
                            style: Themes.headline,
                          ),
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 20,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Text(advice.text),
                          ),
                          decoration: BoxDecoration(
                            color: Themes.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("وذلك في التاريخ ${advice.created_at}"),
                        SizedBox(
                          height: 20,
                        ),
                        Text("الرجاء الالتزام بهذا التوجيه وتطبيقه..."),
                        Divider(),
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
                                      image: AssetImage('images/11.jpg'),
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
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ));
  }
}
