


import '../../util/exports.dart';
import '../../util/toolbar_model.dart';

/// use this MainController class to handle all the Global things
/// ( to handle state of MyApp Widget)

class MainController extends GetxController {
  var toolBarModel = ToolBarModel().obs;

  void setToolBar({ToolBarModel? toolBarModel}) {
    if (toolBarModel == null) {
      this.toolBarModel.value = ToolBarModel();
      return;
    }
    this.toolBarModel.value = toolBarModel;
  }
}
