import 'package:alrazi_project/Themes/Theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../models/TableResault.dart';

class TestResultPaage extends StatelessWidget {
  final ReportModel report ;
  TestResultPaage({required this.report}) ;
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Center(
            child: ListView(
              children: [
                ClipPath(
                  clipper: MessageClipper(borderRadius: 30),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Themes.secondary,
                    ),
                    child: Center(
                        child: Text(
                      "نتيجة الاختبار",
                      style: Themes.headline1,
                    )),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Themes.grey,
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(right: 10, left: 10, bottom: 15),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 1.0, vertical: 1),
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(20.0),
                        child: Table(
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(children: [
                              Text('البعد'),
                              Text('العمر'),
                              Text('النسبة'),
                              Text('العمر الزمني'),
                              Text('مستوى التأخر'),
                            ]),
                            TableRow(children: [
                              Text(report.social.dimenssion , style: Themes.bodyline3,),
                              Text('${report.social.age}' , style: Themes.bodyline3,),
                              Text('${report.social.ratio}'  , style: Themes.bodyline3,),
                              Text('${report.social.t_age}' , style: Themes.bodyline3,),
                              Text('${report.social.level}'  , style: Themes.bodyline3,),
                            ]),
                            TableRow(children: [
                              Text(report.monotor.dimenssion , style: Themes.bodyline3,),
                              Text('${report.monotor.age}'  , style: Themes.bodyline3,),
                              Text('${report.monotor.ratio}' , style: Themes.bodyline3,),
                              Text('${report.monotor.t_age}' , style: Themes.bodyline3,),
                              Text('${report.monotor.level}' , style: Themes.bodyline3,),
                            ]),
                            TableRow(children: [
                              Text(report.know.dimenssion , style: Themes.bodyline3,),
                              Text('${report.know.age}', style: Themes.bodyline3,),
                              Text('${report.know.ratio}' , style: Themes.bodyline3,),
                              Text('${report.know.t_age}' , style: Themes.bodyline3,),
                              Text('${report.know.level}' , style: Themes.bodyline3,),
                            ]),
                            TableRow(children: [
                              Text(report.comm.dimenssion , style: Themes.bodyline3,),
                              Text('${report.comm.age}' , style: Themes.bodyline3,),
                              Text('${report.comm.ratio}', style: Themes.bodyline3,),
                              Text('${report.comm.t_age}', style: Themes.bodyline3,),
                              Text('${report.comm.level}', style: Themes.bodyline3,),
                            ]),
                            TableRow(children: [
                              Text(report.care.dimenssion, style: Themes.bodyline3,),
                              Text('${report.care.age}', style: Themes.bodyline3,),
                              Text('${report.care.ratio}' , style: Themes.bodyline3,),
                              Text('${report.care.t_age}' , style: Themes.bodyline3,),
                              Text('${report.care.level}' , style: Themes.bodyline3,),
                            ])
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Themes.grey,
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(right: 10, left: 10, bottom: 15),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 1.0, vertical: 1),
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(20.0),
                      child: Text("لمحة وملاحظات وملخص عن النتيجة"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child:  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Themes.white,
                        boxShadow: [
                          BoxShadow(
                            color: Themes.grey,
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      height: 400,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: charts.BarChart(
                          _createSampleData(),
                          animate: true,
                        ),
                      ),
                    ),

                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(width: 20,) ,

                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 10,
                    ),
                    SizedBox(width: 20,) ,
                    Text('نتيجة الاختبار قبل الأخير' , style: Themes.bodyline1,)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(width: 20,) ,

                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 10,
                    ),
                    SizedBox(width: 20,) ,

                    Text('نتيجة الاختبار الأخير' , style: Themes.bodyline1,)
                  ],
                ),
                SizedBox(height: 50,)
              ],
            ),
          ),
        ));
  }

  List<charts.Series<Resault, String>> _createSampleData() {
    final data = [
      Resault('الاجتماعي', report.old_social_ratio.toDouble() , report.new_social_ratio.toDouble()),
      Resault('المعرفي',report.old_know_ratio.toDouble() , report.new_know_ratio.toDouble()),
      Resault('الاتصالي', report.old_comm_ratio.toDouble() , report.new_comm_ratio.toDouble()),
      Resault('العناية', report.old_care_ratio.toDouble() , report.new_care_ratio.toDouble()),
      Resault('الحركي', report.old_montor_ratio.toDouble() , report.new_montor_ratio.toDouble()),
    ];

    // ignore: unnecessary_null_aware_expression
    return [
      charts.Series<Resault, String>(
        id: 'Sales 1',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (Resault sales, _) => sales.dimenssion,
        measureFn: (Resault sales, _) => sales.old_ratio,
        data: data,
      ),
      charts.Series<Resault, String>(
        id: 'Sales 2',
        colorFn: (_, __) => charts.MaterialPalette.gray.shadeDefault,
        domainFn: (Resault sales, _) => sales.dimenssion,
        measureFn: (Resault sales, _) => sales.new_ratio,
        data: data,
      ),
    ];
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(size.width / 2, 0);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height);
    path.lineTo(size.width, size.height);

    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class Resault {
  final String dimenssion;
  final double old_ratio;
  final double new_ratio;

  Resault(this.dimenssion, double old_ratio, double new_ratio)
      : old_ratio = old_ratio,
        new_ratio = new_ratio;
}
