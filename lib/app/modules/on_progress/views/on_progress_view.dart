import 'package:convex_bottom_bar/convex_bottom_bar.dart';
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
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        items: const [
          TabItem(icon: Icons.home, title: "Home"),
          TabItem(icon: Icons.shopping_cart, title: "Cart"),
          TabItem(icon: Icons.pregnant_woman, title: "On Progress"),
          TabItem(icon: Icons.person, title: "Profile"),
        ],
        initialActiveIndex: pageC.pageIndex.value,
        onTap: (int i) => pageC.changePage(i),
      ),
    );
  }
}
