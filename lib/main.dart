import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:alrazi_project/routes/routes.dart';
import 'package:get_storage/get_storage.dart';

var isLogin = 'false' , role  = ' ';
final storage =const FlutterSecureStorage();

Future<void>  main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await GetStorage.init();
  role = await storage.read(key: 'role') ?? '';
  isLogin = await storage.read(key: 'islogin') ?? '';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static String api = "http://192.168.1.102:8000" ;

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var route ;
    if(role == 'employee')
      {
        route = Routes.EmployeHome;
      }
    else if(role == 'child')
      {
        route = Routes.ParentHome;
      }

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: isLogin == 'true' ? route : Routes.WelcomePage,
      getPages: AppPages.routes,
    );
  }
}
