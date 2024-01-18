import 'package:coshion/app/constant/color.dart';
import 'package:coshion/app/controllers/page_index_controller.dart';
import 'package:coshion/app/modules/detail_outfit/views/detail_outfit_view.dart';
import 'package:coshion/app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import '../controllers/bookmark_controller.dart';

class BookmarkView extends GetView<BookmarkController> {
  final pageC = Get.find<PageIndexController>();
  BookmarkView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Expanded(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 30,
              itemCount: 6,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(DetailOutfitView());
                  },
                  child: ProductCard(
                      isLiked: index % 2 == 0 ? true : false,
                      image: "assets/images/product_example_${index + 1}.png"),
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: colorPrimary,
        unselectedItemColor: colorSecondary,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
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
