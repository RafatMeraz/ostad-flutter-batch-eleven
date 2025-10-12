import 'package:flutter/material.dart';
import 'package:live_class_project/cart_list_screen.dart';
import 'package:live_class_project/product.dart';
import 'package:live_class_project/product_list_provider.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product list'),
        actions: [
          Consumer<ProductListProvider>(
            builder: (context, provider, _) {
              return Badge(
                label: Text(provider.cartItemCount.toString()),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => CartListScreen()));
                  },
                  icon: Icon(Icons.shopping_cart),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ProductListProvider>(
          builder: (context, productListProvider, _) {
            return GridView.builder(
              itemCount: productListProvider.productList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final Product product = productListProvider.productList[index];
                final bool alreadyInCart = productListProvider.isAlreadyCarted(
                    product.id);
                return Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.network(product.imageUrl, height: 75),
                        Text(product.name),
                        Text('\$${product.price}'),
                        FilledButton(
                          onPressed: () {
                            if (alreadyInCart) {
                              productListProvider.removeFromCart(product.id);
                            } else {
                              productListProvider.addToCart(product);
                            }
                          },
                          child: Text(alreadyInCart ? 'Remove' : 'Add to Cart'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
