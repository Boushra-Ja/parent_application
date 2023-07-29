
import 'package:alrazi_project/views/Employe_App/EmployeHome.dart';
import 'package:alrazi_project/views/Parent_App/FamilyHome.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../views/WelcomePage.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: Routes.WelcomePage,
        page: () => WelcomePage(),
    ),
    GetPage(
      name: Routes.EmployeHome,
      page: () => EmployeHome(),
    ),
    GetPage(
      name: Routes.ParentHome,
      page: () => FamilyHome(),
    ),

  ];
}

class Routes {
  static const WelcomePage = '/WelcomePage';
  static const EmployeHome = '/EmployeHome';
  static const ParentHome = '/FamilyHome';

}