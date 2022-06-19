import 'package:get/get.dart';
import 'package:reel_ro/app/modules/auth/signup_screen.dart';
import 'package:reel_ro/app/modules/entry_count/bindings/entry_count_binding.dart';
import 'package:reel_ro/app/modules/entry_count/views/entry_count_view.dart';
import 'package:reel_ro/app/modules/referrals/bindings/referrals_binding.dart';
import 'package:reel_ro/app/modules/referrals/views/referrals_view.dart';
import 'package:reel_ro/app/modules/send_invite/bindings/send_invite_binding.dart';
import 'package:reel_ro/app/modules/send_invite/views/send_invite_view.dart';
import 'package:reel_ro/app/modules/splash/splash_screen.dart';
import 'package:reel_ro/app/routes/app_routes.dart';
import '../modules/auth/login_screen.dart';
import '../modules/homepage/home_page.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => SignupScreen(),
    ),
    GetPage(
      name: AppRoutes.entrycount,
      page: () => EntryCountView(),
      binding: EntryCountBinding(),
    ),
    GetPage(
      name: AppRoutes.referrals,
      page: () => ReferralsView(),
      binding: ReferralsBinding(),
    ),
    GetPage(
      name: AppRoutes.sendinvite,
      page: () => SendInviteView(),
      binding: SendInviteBinding(),
    )
  ];
}
