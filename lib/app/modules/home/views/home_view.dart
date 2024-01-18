import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:coshion/app/constant/color.dart';
import 'package:coshion/app/controllers/auth_controller.dart';
import 'package:coshion/app/controllers/outfit_controller.dart';
import 'package:coshion/app/modules/detail_outfit/views/detail_outfit_view.dart';
import 'package:coshion/app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../../controllers/page_index_controller.dart';

class HomeView extends GetView<HomeController> {
  final pageC = Get.find<PageIndexController>();
  final outfitService = Get.find<OutfitController>();
  final authUser = Get.find<AuthController>();

  final List<String> categoryName = [
    "All",
    "Casual",
    "Chic",
    "Sporty",
    "Streetwear"
  ];
  @override
  Widget build(BuildContext context) {
    print(authUser.idToken);
    return Scaffold(
      backgroundColor: const Color(0xFFF7FBFA),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          print(authUser.idToken);
                        },
                        icon: const Icon(Icons.location_pin),
                        color: colorPrimary,
                        iconSize: 20,
                      ),
                      Text(
                        "${authUser.firebaseUser.value?.phoneNumber}, Indonesia",
                        style: textStylePrimary,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications),
                    iconSize: 28,
                    color: colorPrimary,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Image.asset("assets/images/home_showcase.png", width: 400),
                  Image.asset("assets/images/home_showcase.png", width: 400),
                  Image.asset("assets/images/home_showcase.png", width: 400),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var category in categoryName)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        category,
                        style: textStylePrimary.copyWith(fontSize: 16),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
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
