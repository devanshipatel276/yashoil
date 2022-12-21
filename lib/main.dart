import 'package:loader_overlay/loader_overlay.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/controller/main_controller.dart';
import 'app/core/widgets/main_appbar.dart';
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
    return GestureDetector(
      onTap: () => controller.hideKeyboard(),
      child: ScreenUtilInit(
        designSize: Get.size,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GlobalLoaderOverlay(
            useDefaultLoading: false,
            overlayWidget: Center(
              child: CircularProgressIndicator(
                backgroundColor: AppColors.black.withOpacity(0.2),
              ),
            ),
            child: GetMaterialApp(
              builder: (context, widget) {
                //add this line
                ScreenUtil.init(context);
                return Obx(
                  () {
                    if (controller.toolBarModel.value.isDrawerRequired) {
                      return Scaffold(
                        key: const ValueKey("MainScaffold"),
                        drawer: Drawer(
                          backgroundColor: AppColors.background,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 100,
                              ),
                              OutlinedButton(
                                  onPressed: () {
                                    Scaffold.of(Get.context!).closeDrawer();
                                    controller.toolBarModel.value.navigator
                                        ?.toNamed(AppPages.details);
                                  },
                                  child: const Text("Item1"))
                            ],
                          ),
                        ),
                        body: MediaQuery(
                          //Setting font does not change with system font size
                          data: MediaQuery.of(context)
                              .copyWith(textScaleFactor: 1.0),
                          child: Column(
                            key: const ValueKey("MainColumn"),
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(() {
                                var model = controller.toolBarModel.value;
                                if (model.isToolBarVisible) {
                                  return MainAppBar(model: model);
                                }

                                return Container();
                              }),
                              Expanded(
                                key: const ValueKey("MainExpanded"),
                                child: widget!,
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return Scaffold(
                      key: const ValueKey("MainScaffold"),
                      body: MediaQuery(
                        //Setting font does not change with system font size
                        data: MediaQuery.of(context)
                            .copyWith(textScaleFactor: 1.0),
                        child: Column(
                          key: const ValueKey("MainColumn"),
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() {
                              var model = controller.toolBarModel.value;
                              if (model.isToolBarVisible) {
                                return MainAppBar(model: model);
                              }

                              return Container();
                            }),
                            Expanded(
                              key: const ValueKey("MainExpanded"),
                              child: widget!,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              debugShowCheckedModeBanner: false,
              translations: AppString(),
              locale: Get.deviceLocale,

              fallbackLocale: const Locale('en', 'US'),
              initialBinding: ApplicationBindings(),
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
              title: AppString.appName.tr,
              // theme: _buildShrineTheme(),
              theme: MyAppTheme.theme,
            ),
          );
        },
      ),
    );
  }
}
