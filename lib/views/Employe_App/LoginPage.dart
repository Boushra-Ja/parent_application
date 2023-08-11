import 'package:alrazi_project/controllers/employee/LoginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Themes/Theme.dart';
import '../WelcomePage.dart';
import 'package:email_validator/email_validator.dart';

class LoginPage extends StatelessWidget{
  LoginController controller = Get.put(LoginController()) ;
  final _textController = TextEditingController();
  final _confirmtextController = TextEditingController();

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
                              height: MediaQuery.of(context).size.height * 0.3,
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
                            Row(
                              children: [
                                Expanded(flex: 1, child: SizedBox.shrink()),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    height: 50,
                                    child: Form(
                                      key: controller.emailFormkey,
                                      child: TextFormField(
                                        controller: _textController,
                                        keyboardType: TextInputType.text,
                                        validator: (val) {
                                          if (val!.isEmpty) return "مطلوب";
                                          if (!EmailValidator.validate(_textController.text)) {
                                            return 'الايميل غير صالح' ;
                                          }
                                          return null;
                                        },
                                        onSaved: (val) {
                                          controller.email = val ;
                                        },
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(30)),
                                            hintText: 'البريد الالكتروني',
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
                              height: 15,
                            ),

                            Row(
                              children: [
                                Expanded(flex: 1, child: SizedBox.shrink()),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    height: 50,
                                    child: Form(
                                      key: controller.passwordFormkey,
                                      child: TextFormField(
                                        controller: _confirmtextController,
                                        keyboardType: TextInputType.text,
                                        validator: (val) {
                                          if (val!.isEmpty) return "مطلوب";
                                          if(val.length < 6 )
                                            return 'لا يمكن أن تكون كلمة المرور أقل من 6 أحرف' ;
                                          return null;
                                        },
                                        onSaved: (val) {
                                          controller.password = val ;
                                          },
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(30)),
                                            hintText: 'كلمة المرور',
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
                              height: 25,
                            ),

                            Obx(()=>
                            controller.isLoading.value == true ?
                            const  Center(child:
                            CircularProgressIndicator ()): const Text("")),
                            ButtonTheme(
                              minWidth: MediaQuery.of(context).size.width * 0.4,
                              child: MaterialButton(
                                onPressed: ()async {
                                  await controller.login() ;
                                },
                                color: Themes.primary,
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