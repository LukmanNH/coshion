import 'package:coshion/app/constant/color.dart';
import 'package:coshion/app/controllers/page_index_controller.dart';
import 'package:coshion/app/modules/order/views/history_view.dart';
import 'package:coshion/app/modules/order/views/order_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBookView extends StatelessWidget {
  final pageC = Get.find<PageIndexController>();

  OnBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                              "Order",
                              style: textStylePrimaryOnBoard.copyWith(
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(OrderView());
                          },
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'My Cart ',
                                  style: TextStyle(
                                    color: Color(0xFF2C3333),
                                    fontSize: 16,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: '(3)',
                                  style: TextStyle(
                                    color: Color(0xFF0E8388),
                                    fontSize: 16,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          'On Book',
                          style: TextStyle(
                            color: Color(0xFF2C3333),
                            fontSize: 16,
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(HistoryView());
                          },
                          child: Text(
                            'History',
                            style: TextStyle(
                              color: Color(0xFF2C3333),
                              fontSize: 16,
                              fontFamily: 'Satoshi',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 92,
                        padding: const EdgeInsets.all(10),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFFEBEBEB)),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/product_example_1.png",
                              width: 70,
                            ),
                            const SizedBox(width: 13),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Jaket Klemin Berlin',
                                  style: TextStyle(
                                    color: Color(0xFF2C3333),
                                    fontSize: 12,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Tuesday, 18 Dec 2023',
                                  style: TextStyle(
                                    color: Color(0xFF2C3333),
                                    fontSize: 12,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 20),
                                SizedBox(
                                  width: 100.0, // Set a width for the SizedBox
                                  child: LinearProgressIndicator(
                                    color: Color(0xFF0E8388),
                                    value: 0.5,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(width: 50),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '6 Days Left',
                                  style: TextStyle(
                                    color: Color(0xFF2E4F4F),
                                    fontSize: 12,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 92,
                        padding: const EdgeInsets.all(10),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFFEBEBEB)),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/product_example_1.png",
                              width: 70,
                            ),
                            const SizedBox(width: 13),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Celana Olahraga',
                                  style: TextStyle(
                                    color: Color(0xFF2C3333),
                                    fontSize: 12,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Tuesday, 18 Dec 2023',
                                  style: TextStyle(
                                    color: Color(0xFF2C3333),
                                    fontSize: 12,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 20),
                                SizedBox(
                                  width: 100.0, // Set a width for the SizedBox
                                  child: LinearProgressIndicator(
                                    color: Color(0xFFE75454),
                                    value: 1,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(width: 50),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Return Day',
                                  style: TextStyle(
                                    color: Color(0xFFE75454),
                                    fontSize: 12,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
