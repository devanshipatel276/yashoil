import 'package:url_strategy/url_strategy.dart';

import 'app/ui/main_controller.dart';
import 'util/exports.dart';

void mainDelegate() => Initializer.init(() async {
      Get.put(MainController(),
          permanent: true, tag: (MainController).toString());
      setPathUrlStrategy();
      runApp(const MyApp());
    });

class MyApp extends GetView<MainController> {
  const MyApp({Key? key}) : super(key: key);

  @override
  MainController get controller => Get.find(tag: (MainController).toString());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Get.size,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        // ScreenUtil.init(context);
        return GetMaterialApp(
          builder: EasyLoading.init(
            builder: (context, widget) {
              configLoader();
              //add this line
              ScreenUtil.init(context);
              return Scaffold(
                body: widget!,
              );
            },
          ),
          debugShowCheckedModeBanner: false,
          translations: AppString(),
          locale: const Locale('en', 'US'),
          //Get.deviceLocale,
          fallbackLocale: const Locale('en', 'US'),
          initialBinding: ApplicationBindings(),
          initialRoute: AppPages.splash,
          getPages: AppPages.routes,
          title: AppString.appName.tr,
          theme: MyAppTheme.theme,
        );
      },
    );
  }

  void configLoader() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 40.0
      ..radius = 8.0
      ..maskColor = AppColors.transparent
      ..textColor = AppColors.purpleTextColor
      ..backgroundColor = AppColors.transparent
      ..indicatorColor = AppColors.orangeBackGroundColor
      ..userInteractions = true
      ..dismissOnTap = false;
  }
}
