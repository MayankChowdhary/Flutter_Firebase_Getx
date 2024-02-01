
import 'package:get/get.dart';
import 'package:video_recorder_flutter_demo/modules/login/login_Binding.dart';

import '../modules/home/home_Binding.dart';
import '../modules/home/home_page.dart';
import '../modules/login/login_page.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}