import 'package:firstbank_cib/constants/colors.dart';
import 'package:firstbank_cib/utils/utils.dart';
import 'package:firstbank_cib/view/more/more_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/floating_bar_items.dart';
import 'dashboard/dash_board_screen.dart';
import 'insights/insights_screen.dart';
import 'transfers/transfers_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int selectedIndex = 0;
  Color selectedIconColor = AppColors.primaryColor;
  Color unselectedIconColor = const Color(0XFF898A8D);
  Color color = AppColors.whiteColor2;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<FloatingNavBarItem> items = [
      FloatingNavBarItem(
        iconSvgName: "assets/svg/home.svg",
        page: const DashBoardScreen(),
        title: 'Home',
      ),
      FloatingNavBarItem(
        iconSvgName: "assets/svg/transfer.svg",
        page: const TransfersScreen(),
        title: 'Transfers',
      ),
      FloatingNavBarItem(
        iconSvgName: "assets/svg/insights.svg",
        page: const InsightsScreen(),
        title: 'Insights',
      ),
      FloatingNavBarItem(
        iconSvgName: "assets/svg/more.svg",
        page: const MoreScreen(),
        title: 'More',
      ),
    ];

    changePage(index) {
      // to do later
      setState(() {
        _pageController.jumpToPage(selectedIndex);
        selectedIndex = index;
        print("index: $index");
      });
      setState(() {
        _pageController.jumpToPage(selectedIndex);
        selectedIndex = index;
        print("index: $index");
      });
    }

    Widget floatingNavBarItem(
        FloatingNavBarItem item, int index, bool hapticFeedback) {
      if (item.title.isEmpty) {
        throw Exception(
            'Show title set to true: Missing FloatingNavBarItem title!');
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (hapticFeedback == true) {
                HapticFeedback.mediumImpact();
              }
              setState(() {});

              changePage(index);
            },
            child: Container(
              padding: const EdgeInsets.all(6),
              width: 50,
              child: Utils.renderSVGImage(
                assetName: item.iconSvgName,
                height: 24.0,
                width: 24.0,
                color: index == selectedIndex
                    ? selectedIconColor
                    : unselectedIconColor,
              ),
            ),
          ),
          AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              child: Text(
                item.title,
                style: TextStyle(
                  fontSize: 14,
                  color: index == selectedIndex
                      ? selectedIconColor
                      : unselectedIconColor,
                ),
              ))
        ],
      );
    }

    List<Widget> widgetsBuilder(
        List<FloatingNavBarItem> items, bool hapticFeedback) {
      List<Widget> floatingNavBarItems = [];
      for (int i = 0; i < items.length; i++) {
        Widget item = floatingNavBarItem(items[i], i, hapticFeedback);
        floatingNavBarItems.add(item);
      }
      return floatingNavBarItems;
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: size.width * 100,
        height: size.height * 100,
        child: Stack(
          children: [
            PageView(
              physics:
                  const NeverScrollableScrollPhysics(), //prvent screen swipping only button for home screen

              controller: _pageController,
              children: items.map((item) => item.page).toList(),
              onPageChanged: (index) => changePage(index),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 16.0,
                ),
                child: Container(
                  height: 74,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 15.0,
                    color: color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: widgetsBuilder(items, true),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
