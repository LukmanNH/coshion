import 'package:coshion/app/constant/color.dart';
import 'package:coshion/app/controllers/page_index_controller.dart';
import 'package:coshion/app/modules/detail_outfit/views/detail_outfit_view.dart';
import 'package:coshion/app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import '../controllers/explore_controller.dart';

class ExploreView extends GetView<ExploreController> {
  final pageC = Get.find<PageIndexController>();
  ExploreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(5),
                  hintText: "Search Coshion's Clothing",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(12.0),
                    child: const Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
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
                            image:
                                "assets/images/product_example_${index + 1}.png"),
                      );
                    },
                  ),
                ),
              ),
            ],
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
