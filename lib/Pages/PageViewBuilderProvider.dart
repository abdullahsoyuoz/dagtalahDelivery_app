import 'package:dagtalahdeliveryapp/Pages/CartPage.dart';
import 'package:dagtalahdeliveryapp/Pages/HomePage.dart';
import 'package:dagtalahdeliveryapp/Pages/MenuPage.dart';
import 'package:dagtalahdeliveryapp/Pages/ProfilePage.dart';
import 'package:dagtalahdeliveryapp/Utility/Colors.dart';
import 'package:dagtalahdeliveryapp/Widgets/bottomNavBar.dart';
import 'package:flutter/material.dart';

class PageViewBuilderProvider extends StatefulWidget {
  @override
  _PageViewBuilderProviderState createState() => _PageViewBuilderProviderState();
}

class _PageViewBuilderProviderState extends State<PageViewBuilderProvider> {
  PageController pageController;
  int currentPageIndex =0;

  List<Widget> pages = [
    HomePage(),
    MenuPage(),
    CartPage(),
    ProfilePage()
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(iconData: Icons.home, title: "Home"),
          TabData(iconData: Icons.menu, title: "Menu"),
          TabData(iconData: Icons.shopping_basket, title: "Cart"),
          TabData(iconData: Icons.person, title: "Profile"),
        ],
        activeIconColor: AppColors.main,
        textColor: AppColors.main,
        inactiveIconColor: Colors.grey.withOpacity(0.5),
        circleColor: Colors.white,
        onTabChangedListener: (position) {
          setState(() {
            currentPageIndex = position;
            pageController.jumpToPage(position);
          });
        },
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: pages.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          return pages[index];
        },
      ),
    );
  }
}
