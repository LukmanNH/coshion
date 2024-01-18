import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:coshion/app/constant/color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/page_index_controller.dart';
import '../controllers/on_progress_controller.dart';

class OnProgressView extends GetView<OnProgressController> {
  OnProgressView({Key? key}) : super(key: key);
  final pageC = Get.find<PageIndexController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnProgressView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OnProgressView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: colorPrimary,
        unselectedItemColor: colorSecondary,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: pageC.pageIndex.value,
        onTap: (int i) {
          pageC.changePage(i);
        },
      ),
    );
  }
}
