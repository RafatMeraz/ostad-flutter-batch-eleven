import 'package:flutter/material.dart';
import 'package:live_class_project/models/product_model.dart';
import 'package:live_class_project/screens/update_product_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        width: 30,
        product.image,
        errorBuilder: (_, __, ___) {
          return Icon(Icons.error_outline, size: 30,);
        },
      ),
      title: Text(product.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Code: ${product.code}'),
          Row(
            spacing: 16,
            children: [
              Text('Quantity: ${product.quantity}'),
              Text('Unit Price: ${product.unitPrice}'),
            ],
          ),
        ],
      ),
      trailing: PopupMenuButton<ProductOptions>(
        itemBuilder: (ctx) {
          return [
            PopupMenuItem(value: ProductOptions.update, child: Text('Update')),
            PopupMenuItem(value: ProductOptions.delete, child: Text('Delete')),
          ];
        },
        onSelected: (ProductOptions selectedOption) {
          if (selectedOption == ProductOptions.delete) {
            print('delete');
          } else if (selectedOption == ProductOptions.update) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UpdateProductScreen()),
            );
          }
        },
      ),
    );
  }
}

enum ProductOptions { update, delete }
