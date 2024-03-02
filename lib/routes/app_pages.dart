
import 'package:flutter_firebase_getx/modules/store/store_Binding.dart';
import 'package:flutter_firebase_getx/modules/store/store_page.dart';
import 'package:get/get.dart';

import '../modules/home/home_Binding.dart';
import '../modules/home/home_page.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.store,
      page: () => const StorePage(),
      binding: StoreBinding(),
    ),
  ];
}