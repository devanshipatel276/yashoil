class MenuModel {
  final String title;
  final String imagePath;
  final MenuType menuType;

  MenuModel({
    required this.title,
    required this.imagePath,
    required this.menuType,
  });
}

enum MenuType { addNewOrder }
