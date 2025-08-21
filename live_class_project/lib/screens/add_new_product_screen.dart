import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:live_class_project/widgets/snackbar_message.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  bool _addProductInProgress = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _priceTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _imageUrlTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add new product')),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 8,
              children: [
                TextFormField(
                  controller: _nameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Product name',
                    labelText: 'Product name',
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your value';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _codeTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Product code',
                    labelText: 'Product code',
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your value';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _quantityTEController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Quantity',
                    labelText: 'Quantity',
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your value';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _priceTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Unit price',
                    labelText: 'Unit price',
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your value';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _imageUrlTEController,
                  decoration: InputDecoration(
                    hintText: 'Image Url',
                    labelText: 'Image Url',
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your value';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                Visibility(
                  visible: _addProductInProgress == false,
                  replacement: Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: FilledButton(
                    onPressed: _onTapAddProductButton,
                    child: Text('Add Product'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapAddProductButton() async {
    if (_formKey.currentState!.validate() == false) {
      return;
    }

    _addProductInProgress = true;
    setState(() {});
    // Prepare URI to request
    Uri uri = Uri.parse('http://35.73.30.144:2008/api/v1/CreateProduct');
    // Prepare data
    int totalPrice = int.parse(_priceTEController.text) *
        int.parse(_quantityTEController.text);
    Map<String, dynamic> requestBody = {
      "ProductName": _nameTEController.text,
      "ProductCode": int.parse(_codeTEController.text),
      "Img": _imageUrlTEController.text,
      "Qty":  int.parse(_quantityTEController.text),
      "UnitPrice":  int.parse(_priceTEController.text),
      "TotalPrice": totalPrice
    };
    // Request with data
    Response response = await post(
        uri,
        headers: {
          'Content-Type': 'application/json'
        },
        body: jsonEncode(requestBody),
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      if (decodedJson['status'] == 'success') {
        _clearTextFields();
        showSnackBarMessage(context, 'Product created successfully');
      } else {
        String errorMessage = decodedJson['data'];

        showSnackBarMessage(context, errorMessage);
      }
    }

    _addProductInProgress = false;
    setState(() {});
  }

  void _clearTextFields() {
    _nameTEController.clear();
    _codeTEController.clear();
    _priceTEController.clear();
    _quantityTEController.clear();
    _imageUrlTEController.clear();
  }

  @override
  void dispose() {
    _nameTEController.dispose();
    _priceTEController.dispose();
    _quantityTEController.dispose();
    _imageUrlTEController.dispose();
    _codeTEController.dispose();
    super.dispose();
  }
}
