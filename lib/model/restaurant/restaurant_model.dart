



class RestaurantModel {
  final int id;
  final String name;
  final String image;

  RestaurantModel(this.id, this.name, this.image);

  RestaurantModel.fromJson(Map<String, dynamic> json) :
  id = json['id'],
  name = json['restaurant'],
  image = json['image'];
}
