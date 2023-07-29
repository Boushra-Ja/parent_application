import 'package:alrazi_project/controllers/PasswordController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../Themes/Theme.dart';
import '../WelcomePage.dart';

class PasswordPage extends GetView{
  PasswordController controller = Get.put(PasswordController());

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
                              height: 20,
                            ),

                            Container(
                              child: Text('الرجاء وضع كلمة مرور مناسبة لحسابك..',style: Themes.bodyline1,),
                            ),
                            SizedBox(height: 10,) ,
                            Row(
                              children: [
                                Expanded(flex: 1, child: SizedBox.shrink()),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    height: 70,
                                    child: Form(
                                      key: controller.passwordFormkey,
                                      child: TextFormField(
                                        keyboardType: TextInputType.text,
                                        validator: (val) {
                                          if (val!.isEmpty) return "مطلوب";
                                          else if (val.length < 6) return "كلمة المرور يجب أن تكون أكبر من 6 أحرف";
                                          return null;
                                        },
                                        onSaved: (val) {
                                          controller.password = val!;
                                        },
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(30)),
                                            hintText: "كلمة المرور  ******",
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
                              height: 10,
                            ),
                            Obx(()=>
                            controller.isLoading.value == true ?
                            const  Center(child:
                            CircularProgressIndicator ()): const Text("")),
                            ButtonTheme(
                              minWidth: MediaQuery.of(context).size.width * 0.4,
                              child: MaterialButton(
                                onPressed: () {
                                  controller.save();
                                },
                                color: Themes.primary,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: Text(
                                  "حفظ",
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