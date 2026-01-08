import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/constants.dart';
import 'package:crafty_bay/features/cart/presentation/widgets/inc_dec_button.dart';
import 'package:crafty_bay/features/common/presentation/widgets/center_circular_progress.dart';
import 'package:crafty_bay/features/common/presentation/widgets/rating_view.dart';
import 'package:crafty_bay/features/product/presentation/widgets/color_picker.dart';
import 'package:crafty_bay/features/product/presentation/widgets/product_image_slider.dart';
import 'package:crafty_bay/features/product/presentation/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/presentation/widgets/favourite_button.dart';
import '../providers/product_details_provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  static const name = '/product-details';

  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsProvider _productDetailsProvider =
      ProductDetailsProvider();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _productDetailsProvider.getProductDetails(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: ChangeNotifierProvider(
        create: (_) => _productDetailsProvider,
        child: Consumer<ProductDetailsProvider>(
          builder: (context, _, _) {
            if (_productDetailsProvider.getProductDetailsInProgress) {
              return CenterCircularProgress();
            }

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 16,
                      children: [
                        ProductImageSlider(
                          imageUrls:
                              _productDetailsProvider
                                  .productDetailsModel
                                  ?.photos ??
                              [],
                        ),
                        Padding(
                          padding: .symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              Row(
                                crossAxisAlignment: .start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      _productDetailsProvider
                                              .productDetailsModel
                                              ?.title ??
                                          '',
                                      style: textTheme.titleMedium,
                                    ),
                                  ),
                                  IncDecButton(
                                    maxValue:
                                        _productDetailsProvider
                                            .productDetailsModel
                                            ?.quantity ??
                                        20,
                                    onChange: (newValue) {},
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  RatingView(),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text('Reviews'),
                                  ),
                                  FavouriteButton(),
                                ],
                              ),
                              if (_productDetailsProvider
                                      .productDetailsModel
                                      ?.colors
                                      .isNotEmpty ??
                                  false)
                                Text('Color', style: textTheme.titleMedium),
                              const SizedBox(height: 8),
                              ColorPicker(
                                colors:
                                    _productDetailsProvider
                                        .productDetailsModel
                                        ?.colors ??
                                    [],
                                onChange: (selectedColor) {},
                              ),
                              const SizedBox(height: 16),
                              if (_productDetailsProvider
                                      .productDetailsModel
                                      ?.sizes
                                      .isNotEmpty ??
                                  false)
                                Text('Size', style: textTheme.titleMedium),
                              const SizedBox(height: 8),
                              SizePicker(
                                sizes:
                                    _productDetailsProvider
                                        .productDetailsModel
                                        ?.sizes ??
                                    [],
                                onChange: (selectedSize) {},
                              ),
                              const SizedBox(height: 16),
                              Text('Description', style: textTheme.titleMedium),
                              const SizedBox(height: 8),
                              Text(
                                _productDetailsProvider
                                        .productDetailsModel
                                        ?.description ??
                                    '',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _buildPriceAndAddToCartSection(textTheme),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection(TextTheme textTheme) {
    return Container(
      padding: .all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withAlpha(40),
        borderRadius: .only(topRight: .circular(16), topLeft: .circular(16)),
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              Text('Price', style: textTheme.bodyLarge),
              Text(
                '${Constants.takaSign}${_productDetailsProvider.productDetailsModel?.price ?? ''}',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: .w600,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: FilledButton(onPressed: () {}, child: Text('Add to Cart')),
          ),
        ],
      ),
    );
  }
}
