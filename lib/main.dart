import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/base_page.dart';
import 'package:getx_skeleton/app/modules/Login/index.dart';
import 'package:getx_skeleton/utils/awesome_notifications_helper.dart';
import 'package:logger/logger.dart';
import 'app/components/CustomBottomNavbar/custom_buttom_navbar.dart';
import 'app/data/local/my_shared_pref.dart';
import 'app/routes/app_pages.dart';
import 'app/services/payment/payment_service.dart';
import 'app/services/service_init.dart';
import 'config/theme/my_theme.dart';
import 'config/translations/localization_service.dart';
import 'utils/fcm_helper.dart';

Future<void> main() async {
  // wait for bindings
  WidgetsFlutterBinding.ensureInitialized();

  // initialize local db (hive) and register our custom adapters

  // init shared preference
  await MySharedPref.init();

  // inti fcm services
  await FcmHelper.initFcm();

  // initialize local notifications service
  await AwesomeNotificationsHelper.init();
  await ServiceInit.init();

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      rebuildFactor: (old, data) => true,
      builder: (context, widget) {
        return GetMaterialApp(
          title: "Banko Team",
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          routingCallback: (route) {
            showBottom.value = route?.current != Routes.LOGIN &&
                route?.route.runtimeType == GetPageRoute;
            showBottom.update((val) {});
            CustomBottomNavbar.changePage(route: route?.current);
          },
          builder: (context, widget) {
            bool themeIsLight = MySharedPref.getThemeIsLight();
            return Theme(
              data: MyTheme.getThemeData(isLight: themeIsLight),
              child: BasePage(child: widget),
            );
          },
          initialRoute:
              AppPages.INITIAL, // first screen to show when app is running
          getPages: AppPages.appRoutes(), // app screens
          locale: MySharedPref.getCurrentLocal(), // app language
          translations: LocalizationService
              .getInstance(), // localization services in app (controller app language)
        );
      },
    ),
  );
}
