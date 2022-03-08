import 'package:partypay/model/session/category_model.dart';

class MenuModel {
  final String name;
  final int menuId;
  final List<CategoryModel> categoryList;

  MenuModel(this.name, this.menuId, this.categoryList);

  MenuModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        menuId = json['menu_id'],
        categoryList = (json['category_list'] as List)
            .map((categoryJson) => CategoryModel.fromJson(categoryJson))
            .toList();
}
