import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';
import '../../models/Child.dart';
import '../../views/Parent_App/FamilyHome.dart';

class ParentLoginController extends GetxController{
  final storage = const FlutterSecureStorage();
  late Child child;
  var isLoading = false.obs;
  var unique_number = null;
  final  loginFormkey = GlobalKey<FormState>() ;

  Future<void> doLoginParent() async {
    bool isvalidate = loginFormkey.currentState!.validate();

    if (isvalidate) {
      isLoading.value = true;
      loginFormkey.currentState!.save();

      try {
        var data = await loginParent(unique_number: this.unique_number);

        if (data != null) {
          loginFormkey.currentState!.save();

          Get.off(FamilyHome());
        } else {
          Get.snackbar("Login", "problem in login");
        }
      } finally {
        isLoading(false);
      }
    }
  }

  Future<Child?> loginParent({required unique_number}) async {

    var response = await http.post(Uri.parse('${MyApp.api}/api/parent/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{"unique_number": unique_number}));

    if (response.statusCode == 200 || response.statusCode == 201) {
      ChildModel childModel = ChildModel.fromJson(jsonDecode(response.body));
      child = new Child(
          id: childModel.data[0].id,
          name: childModel.data[0].name,
          unique_number: childModel.data[0].unique_number,
          age: childModel.data[0].age,
          infection: childModel.data[0].infection,
          section: childModel.data[0].section,
          phone_num: childModel.data[0].phone_num);

      await storage.write(key: "name", value: '${child.name}');
      await storage.write(key: "id", value: '${child.id}');
      await storage.write(key: "infection", value: '${child.infection}');
      await storage.write(key: "section", value: '${child.section}');
      await storage.write(key: "islogin", value: 'true');
      await storage.write(key: "role", value: 'child');

      var n = await storage .read(key: 'name') ;
      print('dddddddddddddddddddddddddd');
      print(n);
      var t = await storage .read(key: 'type') ;
      print(t);

      return this.child;
    } else
      return null;
  }

  @override
  void onInit() {

    super.onInit();
  }

  void dispose() {

    super.dispose();
  }
}