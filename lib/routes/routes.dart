
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../views/WelcomePage.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: Routes.WelcomePage,
        page: () => WelcomePage(),
    ),

  ];
}

class Routes {
  static const WelcomePage = '/WelcomePage';

}