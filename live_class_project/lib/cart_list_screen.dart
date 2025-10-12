import 'package:flutter/material.dart';
import 'package:live_class_project/product.dart';
import 'package:live_class_project/product_list_provider.dart';
import 'package:provider/provider.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carts')),
      body: Consumer<ProductListProvider>(
        builder: (context, productListProvider, child) {
          return ListView.builder(
            itemCount: productListProvider.cartProductList.length,
            itemBuilder: (context, index) {
              final Product product =
                  productListProvider.cartProductList[index];
              return ListTile(
                title: Text(product.name),
                trailing: IconButton(
                  onPressed: () {
                    productListProvider.removeFromCart(product.id);
                  },
                  icon: Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
