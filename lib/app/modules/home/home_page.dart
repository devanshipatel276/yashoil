
import '../../../base/base_responsive_view.dart';
import '../../../util/exports.dart';
import 'home_controller.dart';

/// always use BaseGetView or BaseGetResponsiveView for the pages or screens

class HomePage extends BaseGetResponsiveView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  String? getTag() {
    return (HomeController).toString();
  }

  @override
  Widget buildDesktopWidget() {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text("Material 3 Home"),
            leading: const BackButton(),
            actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))]),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "Label1"),
          BottomNavigationBarItem(icon: Icon(Icons.accessibility), label: "Label2"),
          BottomNavigationBarItem(icon: Icon(Icons.accessible), label: "Label3"),
        ]),
        floatingActionButton: FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
        body: Center(
          child: Column(
            children: [
              TabBar(
                tabs: const [
                  Text("Tab 1"),
                  Text("Tab 2"),
                  Text("Tab 3"),
                ],
                controller: TabController(length: 3, vsync: controller),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'TextFields',
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextField(
                                controller: TextEditingController(text: "Normal"),
                                decoration: const InputDecoration(
                                  labelText: "Its Normal Label",
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const TextField(
                                decoration: InputDecoration(
                                  errorText: "Its,Error",
                                  labelText: "Its Normal Label",
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextField(
                                controller: TextEditingController(text: "Disabled"),
                                enabled: false,
                                readOnly: true,
                                decoration: const InputDecoration(
                                  labelText: "Its Disabled Label",
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const CircularProgressIndicator(),
                              const SizedBox(
                                height: 20,
                              ),
                              const Switch(value: false, onChanged: null),
                              const SizedBox(
                                height: 20,
                              ),
                              Obx(()=> Switch(value: controller.switch1.value, onChanged: (value){
                                controller.switch1.value = value;
                              })),
                              const SizedBox(
                                height: 20,
                              ),
                              OutlinedButton(onPressed: (){}, child: const Text("OutLined")),
                              const SizedBox(
                                height: 20,
                              ),
                              TextButton(onPressed: (){}, child: const Text("TextButton"))
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text("Buttons"),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                // style: ElevatedButton.styleFrom(
                                //   // Foreground color
                                //   onPrimary: Theme.of(Get.context!).colorScheme.onPrimary,
                                //   // Background color
                                //   primary: Theme.of(Get.context!).colorScheme.primary,
                                // ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                                onPressed: () {},
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                  child: Text(
                                    "Elevated Button",
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              IconButton(onPressed: () {}, icon: const Icon(Icons.access_time_outlined)),
                              const SizedBox(
                                height: 20,
                              ),
                              TextButton(onPressed: () {}, child: const Text("Text Button")),
                              const SizedBox(
                                height: 20,
                              ),
                              CloseButton(onPressed: () {}, color: Colors.white70),
                              const SizedBox(
                                height: 20,
                              ),
                              OutlinedButton(onPressed: () {}, child: const Text("OutLine Button")),
                              const SizedBox(
                                height: 20,
                              ),
                              MaterialButton(onPressed: () {}, child: const Text("MaterialButton")),
                              const SizedBox(
                                height: 20,
                              ),
                              DropdownButton<int>(
                                  onChanged: (b) {},
                                  items: const [
                                    DropdownMenuItem(
                                      value: 1,
                                      child: Text("DropDown 1"),
                                    ),
                                    DropdownMenuItem(
                                      value: 2,
                                      child: Text("DropDown 2"),
                                    ),
                                    DropdownMenuItem(
                                      value: 3,
                                      child: Text("DropDown 3"),
                                    )
                                  ],
                                  value: 1),
                              const SizedBox(
                                height: 20,
                              ),
                              PopupMenuButton(
                                itemBuilder: (context) {
                                  return List.of([const PopupMenuItem(child: Text("PopupMenu 1"))]);
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              MaterialButton(onPressed: () {}, child: const Text("MaterialButton")),
                              const SizedBox(
                                height: 50,
                              ),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      const Text("Card Item 1"),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      IconButton(onPressed: () {}, icon: const Icon(Icons.access_time_outlined)),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextButton(onPressed: () {}, child: const Text("Text Button")),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget buildPhoneWidget() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'HomePage is working in Phone Mode',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // Foreground color
                  onPrimary: Theme.of(Get.context!).colorScheme.onTertiary,
                  // Background color
                  primary: Theme.of(Get.context!).colorScheme.tertiary,
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                onPressed: () {
                  controller.toNamed(AppPages.details);
                },
                child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      "Go To DetailsPage",
                      // style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(color: Colors.amberAccent),
                    ))),
            const TextField()
          ],
        ),
      ),
    );
  }

  @override
  Widget buildTabletWidget() {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'HomePage is working Tablet Mode',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.toNamed(AppPages.details);
                  },
                  child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), child: Text("Go To DetailsPage")))
            ],
          ),
        ),
      ),
    );
  }
}
