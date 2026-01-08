import 'package:crafty_bay/features/common/presentation/widgets/favourite_button.dart';
import 'package:crafty_bay/features/product/data/models/product_model.dart';
import 'package:crafty_bay/features/product/presentation/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/constants.dart';
import 'rating_view.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.name, arguments: productModel.id);
      },
      child: SizedBox(
        width: 150,
        child: Card(
          elevation: 3,
          shadowColor: AppColors.themeColor.withAlpha(50),
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: .circular(8)),
          child: Column(
            children: [
              Container(
                width: 150,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: .only(
                    topRight: .circular(8),
                    topLeft: .circular(8),
                  ),
                  color: AppColors.themeColor.withAlpha(30),
                  image: DecorationImage(
                    image: NetworkImage(
                      productModel.photo,
                    ),
                    fit: .cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      productModel.title,
                      maxLines: 1,
                      style: TextStyle(overflow: .ellipsis),
                    ),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          '${Constants.takaSign}${productModel.currentPrice}',
                          style: TextStyle(
                            fontWeight: .w600,
                            color: AppColors.themeColor,
                          ),
                        ),
                        RatingView(),
                        FavouriteButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
