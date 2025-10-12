import 'package:flutter/foundation.dart';

import 'product.dart';

class ProductListProvider extends ChangeNotifier {
  final List<Product> _productList = [
    Product(
      id: 1,
      name: 'iPhone 17',
      price: 120000,
      imageUrl:
      'https://ipoint.ae/cdn/shop/files/Screen_Shot_2025-08-13_at_12.41.22_PM.png?v=1758475707&width=592',
    ),
    Product(
      id: 2,
      name: 'iPhone 17 Pro',
      price: 1239023,
      imageUrl:
      'https://ipoint.ae/cdn/shop/files/Screen_Shot_2025-08-13_at_12.41.22_PM.png?v=1758475707&width=592',
    ),
    Product(
      id: 3,
      name: 'iPhone 17 Max',
      price: 340923,
      imageUrl:
      'https://ipoint.ae/cdn/shop/files/Screen_Shot_2025-08-13_at_12.41.22_PM.png?v=1758475707&width=592',
    ),
    Product(
      id: 4,
      name: 'iPhone 17 Nano',
      price: 230904,
      imageUrl:
      'https://ipoint.ae/cdn/shop/files/Screen_Shot_2025-08-13_at_12.41.22_PM.png?v=1758475707&width=592',
    ),
    Product(
      id: 5,
      name: 'iPhone 17',
      price: 120000,
      imageUrl:
      'https://ipoint.ae/cdn/shop/files/Screen_Shot_2025-08-13_at_12.41.22_PM.png?v=1758475707&width=592',
    ),
    Product(
      id: 6,
      name: 'iPhone 17',
      price: 120000,
      imageUrl:
      'https://ipoint.ae/cdn/shop/files/Screen_Shot_2025-08-13_at_12.41.22_PM.png?v=1758475707&width=592',
    ),
    Product(
      id: 7,
      name: 'iPhone 17',
      price: 120000,
      imageUrl:
      'https://ipoint.ae/cdn/shop/files/Screen_Shot_2025-08-13_at_12.41.22_PM.png?v=1758475707&width=592',
    ),
  ];

  final List<Product> _cartProductList = [];

  List<Product> get productList => _productList;

  List<Product> get cartProductList => _cartProductList;

  int get cartItemCount => _cartProductList.length;

  void addToCart(Product p) {
    for (Product product in _cartProductList) {
      if (product.id == p.id) {
        return;
      }
    }

    _cartProductList.add(p);
    notifyListeners();
  }

  void removeFromCart(int id) {
    _cartProductList.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  bool isAlreadyCarted(int id) {
    return _cartProductList.where((e) => e.id == id).isNotEmpty;
  }
}