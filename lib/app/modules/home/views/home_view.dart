import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:coshion/app/constant/color.dart';
import 'package:coshion/app/controllers/outfit_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../../controllers/page_index_controller.dart';

class HomeView extends GetView<HomeController> {
  final pageC = Get.find<PageIndexController>();
  final outfitService = Get.find<OutfitController>();

  var itemName = [
    "Adat Betawi",
    "Long Sleeve",
    "Canvas Jacket",
    "Hoodie",
    "Dress",
    "Jeans"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(
                  'Search',
                  style: TextStyle(
                    fontSize: 20,
                    color: TEXT_PRIMARY,
                    fontFamily: 'ro',
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Search Anything...',
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    Outfit outfit = outfitService.outfit[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed("/detail-outfit/${index + 1}");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 185, 185, 185),
                              offset: Offset(1, 1),
                              blurRadius: 15,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            const Padding(
                              padding: EdgeInsets.only(right: 14),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [Icon(Icons.favorite_border)],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                              child: Container(
                                height: 120,
                                width: 120,
                                child: FadeInImage(
                                  placeholder: const AssetImage(
                                      "assets/images/loading.gif"),
                                  image: NetworkImage(outfit.gambar),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              outfit.nama,
                              style: const TextStyle(
                                fontSize: 18,
                                color: APP_SECONDARY,
                                fontFamily: 'ro',
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  outfit.harga.toString(),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontFamily: 'ro',
                                  ),
                                ),
                                const Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: APP_PRIMARY, size: 15),
                                    Text(
                                      '4.2',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontFamily: 'ro',
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: outfitService.outfit.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 270,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
              ),
            ),
          ],
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
