import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({super.key, required this.imageUrls});

  final List<String> imageUrls;

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 240,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              _selectedIndex.value = index;
            },
            autoPlay: false,
          ),
          items: widget.imageUrls.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: .center,
                  decoration: BoxDecoration(
                    color: Colors.grey.withAlpha(50),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: .fitHeight,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: _selectedIndex,
            builder: (context, selectedIndex, _) {
              return Row(
                mainAxisAlignment: .center,
                children: [
                  for (int i = 0; i < widget.imageUrls.length; i++)
                    Container(
                      width: 12,
                      height: 12,
                      margin: EdgeInsets.only(right: 4),
                      decoration: BoxDecoration(
                        color: i == selectedIndex ? AppColors.themeColor : null,
                        border: Border.all(color: Colors.grey),
                        borderRadius: .circular(16),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
