import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/home/data/models/slider_model.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key, required this.sliders});

  final List<SliderModel> sliders;

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              _selectedIndex.value = index;
            },
            autoPlay: false,
          ),
          items: widget.sliders.map((slider) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(slider.photoUrl),
                      fit: .cover,
                    ),
                  ),
                  alignment: .center,
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        ValueListenableBuilder(
          valueListenable: _selectedIndex,
          builder: (context, selectedIndex, _) {
            return Row(
              mainAxisAlignment: .center,
              children: [
                for (int i = 0; i < 5; i++)
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
      ],
    );
  }
}
