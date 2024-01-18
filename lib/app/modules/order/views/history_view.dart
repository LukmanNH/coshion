import 'package:coshion/app/constant/color.dart';
import 'package:coshion/app/controllers/page_index_controller.dart';
import 'package:coshion/app/modules/order/views/on_book_view.dart';
import 'package:coshion/app/modules/order/views/order_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryView extends StatelessWidget {
  final pageC = Get.find<PageIndexController>();
  HistoryView({super.key});

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
                        InkWell(
                          onTap: () {
                            Get.to(OnBookView());
                          },
                          child: Text(
                            'On Book',
                            style: TextStyle(
                              color: Color(0xFF2C3333),
                              fontSize: 16,
                              fontFamily: 'Satoshi',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(
                          'History',
                          style: TextStyle(
                            color: Color(0xFF2C3333),
                            fontSize: 16,
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.w700,
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
                            Column(
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
                                Row(
                                  children: [
                                    Container(
                                      width: 8,
                                      height: 8,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFF3B2D2C),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    const Text(
                                      'Brown',
                                      style: TextStyle(
                                        color: Color(0xFF2C3333),
                                        fontSize: 12,
                                        fontFamily: 'Satoshi',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    const Text(
                                      'Size S',
                                      style: TextStyle(
                                        color: Color(0xFF2C3333),
                                        fontSize: 12,
                                        fontFamily: 'Satoshi',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'IDR 64.000',
                                  style: TextStyle(
                                    color: Color(0xFF0E8388),
                                    fontSize: 12,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
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
                              "assets/images/product_example_2.png",
                              width: 70,
                            ),
                            const SizedBox(width: 13),
                            Column(
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
                                Row(
                                  children: [
                                    Container(
                                      width: 8,
                                      height: 8,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFF3B2D2C),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    const Text(
                                      'Brown',
                                      style: TextStyle(
                                        color: Color(0xFF2C3333),
                                        fontSize: 12,
                                        fontFamily: 'Satoshi',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    const Text(
                                      'Size L',
                                      style: TextStyle(
                                        color: Color(0xFF2C3333),
                                        fontSize: 12,
                                        fontFamily: 'Satoshi',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'IDR 50.000',
                                  style: TextStyle(
                                    color: Color(0xFF0E8388),
                                    fontSize: 12,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
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
