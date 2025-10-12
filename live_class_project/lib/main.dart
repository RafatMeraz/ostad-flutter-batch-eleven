import 'package:flutter/material.dart';
import 'package:live_class_project/product_list_provider.dart';
import 'package:live_class_project/product_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ProductListApp());
}

class ProductListApp extends StatelessWidget {
  const ProductListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductListScreen(),
      ),
    );
  }
}
