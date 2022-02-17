import 'package:partypay/model/session/category_model.dart';

class MenuModel {
  final String name;
  final List<CategoryModel> categoryList;

  MenuModel(this.name, this.categoryList);

  MenuModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        categoryList = (json['category_list'] as List)
            .map((categoryJson) => CategoryModel.fromJson(categoryJson))
            .toList();
}
