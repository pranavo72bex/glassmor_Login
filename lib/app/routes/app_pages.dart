import 'package:get/get.dart';

import 'package:glassmor_login/app/modules/home/bindings/home_binding.dart';
import 'package:glassmor_login/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const inital = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
