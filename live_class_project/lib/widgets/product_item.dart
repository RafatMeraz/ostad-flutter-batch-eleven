import 'package:flutter/material.dart';
import 'package:live_class_project/screens/update_product_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(),
      title: Text('Product name'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Code: 239293823'),
          Row(
            spacing: 16,
            children: [Text('Quantity: 5'), Text('Unit Price: 500')],
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
