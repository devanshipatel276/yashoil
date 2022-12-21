
import '../../../service/api/api_handler.dart';
import '../../../service/api/api_manager.dart';
import '../../../util/exports.dart';


/// you can add here some dependencies which you need for app level scope
/// as we added ApiManager and ApiHandler which we need at anywhere in the app to do call apis
/// access it using Get.find(tag : (ApiManager).toString())

class ApplicationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiHandler(),tag: (ApiHandler).toString());
    Get.lazyPut(() => ApiManager(),tag: (ApiManager).toString());

  }
}
