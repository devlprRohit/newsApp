import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:newsapp/views/news_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;
}

class BottomNav extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  final List<Widget> pages = [
    NewsScreen(),
    Center(child: Text("Favorites", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => AnimatedSwitcher(
        duration: Duration(milliseconds: 250),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: pages[controller.selectedIndex.value],
      )),
      bottomNavigationBar: Obx(() => CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.blueAccent,
        buttonBackgroundColor: Colors.blue,
        height: 50,
        animationDuration: Duration(milliseconds: 300),
        index: controller.selectedIndex.value,
        onTap: (index) => controller.selectedIndex.value = index,
        items: [
          Icon(FontAwesomeIcons.house, size: 30, color: Colors.white),
          Icon(FontAwesomeIcons.heart, size: 30, color: Colors.white),
        ],
      )),
    );
  }
}
