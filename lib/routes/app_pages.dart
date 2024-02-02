
import 'package:get/get.dart';
import 'package:video_recorder_flutter_demo/modules/login/login_Binding.dart';
import 'package:video_recorder_flutter_demo/modules/login/otp_page.dart';

import '../modules/home/home_Binding.dart';
import '../modules/home/home_page.dart';
import '../modules/login/login_page.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.otp,
      page: () =>  const OTPPage(),
      binding: LoginBinding(),
    ),
  ];
}