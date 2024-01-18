import 'package:coshion/app/constant/color.dart';
import 'package:coshion/app/controllers/auth_controller.dart';
import 'package:coshion/app/widgets/customButton.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/page_index_controller.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);
  final pageC = Get.find<PageIndexController>();
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  color: Color(0xFFF7FBFA),
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.arrow_back),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "My Profile",
                                  style: textStylePrimaryOnBoard.copyWith(
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/images/avatar.png"),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Lukman Nur Hakim',
                                  style: TextStyle(
                                    color: Color(0xFF2C3333),
                                    fontSize: 16,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Luckman@gmail.com',
                                  style: TextStyle(
                                    color: Color(0xFF2E4F4F),
                                    fontSize: 12,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 70,
                              height: 32,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 6),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1, color: Color(0xFF0E8388)),
                                  borderRadius: BorderRadius.circular(1000),
                                ),
                              ),
                              child: const Text(
                                'Tier 1',
                                style: TextStyle(
                                  color: Color(0xFF0E8388),
                                  fontSize: 12,
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: Column(
                  children: [
                    const Text(
                      'Personal Information',
                      style: TextStyle(
                        color: Color(0xFF2C3333),
                        fontSize: 16,
                        fontFamily: 'Satoshi',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFECECEC)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            'Phone Number',
                            style: TextStyle(
                              color: Color(0xFF2C3333),
                              fontSize: 14,
                              fontFamily: 'Satoshi',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '+62 82134850812',
                            style: TextStyle(
                              color: Color(0xFF838A88),
                              fontSize: 12,
                              fontFamily: 'Satoshi',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFECECEC)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            'Shipping Address',
                            style: TextStyle(
                              color: Color(0xFF2C3333),
                              fontSize: 14,
                              fontFamily: 'Satoshi',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Jl. H. Juhri, RT.1/RW.8, Meruya Sel., Kec. Kembangan, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11650',
                            style: TextStyle(
                              color: Color(0xFF838A88),
                              fontSize: 12,
                              fontFamily: 'Satoshi',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  authController.signOut();
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 26)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFFE75454)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  side: MaterialStateProperty.all<BorderSide>(
                    const BorderSide(
                      color: Color(0xFFE75454),
                    ),
                  ),
                ),
                child: const Text(
                  "Log out",
                  style: TextStyle(
                    fontFamily: "Satoshi",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
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
