import 'package:get/get.dart';
import 'package:portfolio/modules/home/home_screen.dart';

class AppRoutes {
  static const home = Routes.home;

  static final getPages = [
    GetPage(
      name: Routes.home,
      page: () =>  HomeScreen(),
    ),
  ];
}

class Routes {
  static const home = "/home";
}
