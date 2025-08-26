class ProductModel {
  late String id;
  late String name;
  late int code;
  late String image;
  late int quantity;
  late int unitPrice;
  late int totalPrice;

  ProductModel.fromJson(Map<String, dynamic> productJson) {
    id = productJson['_id'];
    name = productJson['ProductName'];
    code = productJson['ProductCode'];
    image = productJson['Img'];
    quantity = productJson['Qty'];
    unitPrice = productJson['UnitPrice'];
    totalPrice = productJson['TotalPrice'];
  }
}
