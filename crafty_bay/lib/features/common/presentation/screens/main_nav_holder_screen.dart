import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/cart/presentation/screens/cart_list_screen.dart';
import 'package:crafty_bay/features/category/presentation/providers/category_list_provider.dart';
import 'package:crafty_bay/features/common/presentation/providers/main_nav_container_provider.dart';
import 'package:crafty_bay/features/home/presentation/provider/home_slider_provider.dart';
import 'package:crafty_bay/features/home/presentation/screens/home_screen.dart';
import 'package:crafty_bay/features/home/presentation/widgets/home_carousel_slider.dart';
import 'package:crafty_bay/features/wish_list/presentation/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../auth/presentation/providers/auth_controller.dart';
import '../../../auth/presentation/screens/sign_in_screen.dart';
import '../../../category/presentation/screens/category_list_screen.dart';

class MainNavHolderScreen extends StatefulWidget {
  const MainNavHolderScreen({super.key});

  static const String name = '/main-bottom-nav-holder';

  @override
  State<MainNavHolderScreen> createState() => _MainNavHolderScreenState();
}

class _MainNavHolderScreenState extends State<MainNavHolderScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    CategoryListScreen(),
    CartListScreen(),
    WishListScreen(),
  ];

  @override
  void initState() {
    super.initState();
    context.read<CategoryListProvider>().fetchCategoryList();
    context.read<HomeSliderProvider>().getHomeSliders();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainNavContainerProvider>(
      builder: (context, mainNavContainerProvider, _) {
        return Scaffold(
          body: _screens[mainNavContainerProvider.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: AppColors.themeColor,
            currentIndex: mainNavContainerProvider.selectedIndex,
            onTap: (int index) async {
              if (index == 2 || index == 3) {
                if (await AuthController.isAlreadyLoggedIn() == false) {
                  Navigator.pushNamed(context, SignUpScreen.name);
                  return;
                }
              }

              mainNavContainerProvider.changeItem(index);
            },
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_customize),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Carts',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline_rounded),
                label: 'Wishlist',
              ),
            ],
          ),
        );
      },
    );
  }
}
