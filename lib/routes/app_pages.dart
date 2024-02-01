
import 'package:get/get.dart';

import '../modules/home/home_Binding.dart';
import '../modules/home/home_page.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}