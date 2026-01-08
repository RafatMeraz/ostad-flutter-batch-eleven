// POJO/Model class
class ProductDetailsModel {
  final String id;
  final String title;
  final String description;
  final List<String> photos;
  final List<String> colors;
  final List<String> sizes;
  final double price;
  final int quantity;

  ProductDetailsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.photos,
    required this.colors,
    required this.sizes,
    required this.price,
    required this.quantity,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      photos: List<String>.from(json['photos']),
      colors: List<String>.from(json['colors']),
      sizes: List<String>.from(json['sizes']),
      price: json['current_price'].toDouble(),
      quantity: json['quantity'],
    );
  }
}
