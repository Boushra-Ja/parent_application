import 'package:alrazi_project/Themes/Theme.dart';
import 'package:alrazi_project/controllers/employee/EmpLoginController.dart';
import 'package:alrazi_project/views/Employe_App/LoginPage.dart';
import 'package:alrazi_project/views/Employe_App/RegisterPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import '../WelcomePage.dart';

class EmployeeLogin extends GetView<EmpLoginController> {
  EmpLoginController controller = Get.put(EmpLoginController());
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Container(
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
                    clipper: WaveClipper(waveDeep: 0, waveDeep2: 100),
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
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.4,
                              width: MediaQuery.of(context).size.width * 0.7,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/imge.jpg'),
                                ),
                              ),
                            ),
                            Divider(),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox.shrink(),
                                  flex: 1,
                                ),
                                Expanded(
                                  flex: 4,
                                  child: ButtonTheme(
                                    minWidth:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: MaterialButton(
                                      onPressed: () {
                                        Get.to(LoginPage()) ;
                                      },
                                      color: Themes.primary,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Text(
                                        "تسجيل دخول",
                                        style: Themes.headline1,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox.shrink(),
                                  flex: 1,
                                ),
                                Expanded(
                                  flex: 4,
                                  child: ButtonTheme(
                                    minWidth:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: MaterialButton(
                                      onPressed: () {

                                        Get.to(RegisterPage()) ;
                                      },
                                      color: Themes.primary,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Text(
                                        "إنشاء حساب",
                                        style: Themes.headline1,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox.shrink(),
                                  flex: 1,
                                )
                              ],
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
