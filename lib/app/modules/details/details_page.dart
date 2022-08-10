import 'package:flutter/material.dart';
import '../../../base/base_view.dart';
import 'details_controller.dart';

class DetailsPage extends BaseGetView<DetailsController> {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget buildView() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'DetailsPage is working',
              style: TextStyle(fontSize: 20),
            ),
            /*const SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              controller.mainController.toolBarModel.value =
              controller.mainController.toolBarModel.value.isToolBarVisible ?
                  ToolBarModel(isToolBarVisible: false) :
                  ToolBarModel(isToolBarVisible: true, title: "HomePage");
            }, child: const Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text("Show and Hide ToolBar")))*/
          ],
        ),
      ),
    );
  }

  @override
  String? getTag() {
    return (DetailsController).toString();
  }
}
