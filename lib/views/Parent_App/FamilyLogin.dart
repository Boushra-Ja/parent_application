import 'package:alrazi_project/Themes/Theme.dart';
import 'package:alrazi_project/controllers/LoginController.dart';
import 'package:alrazi_project/views/Parent_App/FamilyHome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../WelcomePage.dart';

class FamilyLogin extends StatelessWidget {
  LoginController controller = Get.put(LoginController());

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
                              height: 40,
                            ),
                            Row(
                              children: [
                                Expanded(flex: 1, child: SizedBox.shrink()),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    height: 50,
                                    child: Form(
                                      key: controller.loginFormkey,
                                      child: TextFormField(
                                        keyboardType: TextInputType.text,
                                        validator: (val) {
                                          if (val!.isEmpty) return "مطلوب";
                                          return null;
                                        },
                                        onSaved: (val) {
                                          controller.unique_number = val;
                                        },
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            hintText: "#الرقم المميز للطفل",
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14),
                                            contentPadding: EdgeInsets.fromLTRB(
                                                10.0, 0.01, 20.0, 0.01),
                                            filled: true,
                                            fillColor: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(flex: 1, child: SizedBox.shrink()),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ButtonTheme(
                              minWidth: MediaQuery.of(context).size.width * 0.4,
                              child: MaterialButton(
                                onPressed: () {
                                  controller.doLoginParent();
                                },
                                color: Themes.secondary,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: Text(
                                  "تسجيل",
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
          ),
        ));
  }
}
