import 'package:alrazi_project/Themes/Theme.dart';
import 'package:alrazi_project/controllers/parent/AdvicePageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdvicePage extends StatelessWidget {
  final AdvicePageController _controller = Get.put(AdvicePageController());

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
                      _controller.fetchMyAdvice();
                    },
                  );
                },
                child: Obx((){
                  if (_controller.AdviceList.isEmpty) {
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
                            "لا يوجد توجيهات متاحة",
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
                        ListView.builder(
                            itemCount: _controller.AdviceList.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, i) {
                              return Container(
                                decoration: new BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Themes.grey,
                                      blurRadius: 25.0,
                                    ),
                                  ],
                                ),
                                margin: EdgeInsets.only(
                                    right: 10, left: 10, bottom: 15),
                                child: Card(
                                  shape: BeveledRectangleBorder(
                                    //<-- 2. SEE HERE
                                    side: BorderSide(
                                      color: Themes.grey,
                                      width: 0.2,
                                    ),
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 30),
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Text(
                                            'التوجيه ${i + 1}',
                                            style: Themes.headline2,
                                          ),
                                        ),
                                        Divider(),
                                        Text(
                                          _controller.AdviceList.elementAt(
                                              i)
                                              .text,
                                          style: Themes.bodyline1,
                                        ),
                                      ],
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
