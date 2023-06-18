
import 'package:alrazi_project/Themes/Theme.dart';
import 'package:alrazi_project/views/Parent_App/FamilyHome.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'Employe_App/EmployeeLogin.dart';
import 'Parent_App/FamilyLogin.dart';

class WelcomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 650,
            ),
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                padding: const EdgeInsets.only(bottom: 450),
                color: Themes.secondary.withOpacity(.8),
                height: 140,
                alignment: Alignment.center,

              ),
            ),
            ClipPath(
              clipper: WaveClipper(waveDeep: 0, waveDeep2: 100 ),
              child: Container(
                padding: const EdgeInsets.only(bottom: 50),
                color: Themes.primary.withOpacity(.3),
                height: 100,
                alignment: Alignment.center,

              ),
            ),
            Positioned(
                top: 140,

                child: Container(
                  height: MediaQuery.of(context).size.height ,
                  width: MediaQuery.of(context).size.width ,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/imge.jpg'),
                      ),
                    ),
                  ),

                  Divider() ,
                  SizedBox(height: 30,) ,
                  ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.06,

                    child:  MaterialButton(
                      onPressed: () {
                        Get.to(EmployeeLogin()) ;
                      },
                      color: Themes.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(30)),
                      child: Text(
                        " تسجيل دخول الموظف ",
                        style: Themes.headline1,
                      ),
                    ),

                  ),
                  SizedBox(height: 20,) ,
                  ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.06,

                    child:  MaterialButton(
                      onPressed: () {
                        Get.to(FamilyLogin()) ;
                      },
                      color: Themes.secondary,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(30)),
                      child: Text(
                        " تسجيل دخول الأهل ",
                        style: Themes.headline1,
                      ),
                    ),

                  ),
                ],
              ),
            ))


          ],
        ),
      ),
    ) ;
  }

}

class WaveClipper extends CustomClipper<Path> {
  final double waveDeep;
  final double waveDeep2;


  WaveClipper({this.waveDeep = 100,this.waveDeep2 = 0});
  @override
  Path getClip(Size size) {
    final double sw = size.width;
    final double sh = size.height;

    final Offset controlPoint1 = Offset(sw * .25 , sh -waveDeep2*2);
    final Offset destinationPoint1 = Offset(sw * .5  , sh - waveDeep- waveDeep2);

    final Offset controlPoint2 = Offset(sw * .75 , sh  - waveDeep*2 );
    final Offset destinationPoint2 = Offset(sw  , sh - waveDeep);

    final Path path = Path()
      ..lineTo(0, size.height-waveDeep2)
      ..quadraticBezierTo(controlPoint1.dx, controlPoint1.dy, destinationPoint1.dx, destinationPoint1.dy
      )
      ..quadraticBezierTo(controlPoint2.dx, controlPoint2.dy ,destinationPoint2.dx, destinationPoint2.dy
      )
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}