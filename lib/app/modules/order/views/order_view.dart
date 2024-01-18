import 'package:coshion/app/constant/color.dart';
import 'package:coshion/app/controllers/page_index_controller.dart';
import 'package:coshion/app/modules/order/views/history_view.dart';
import 'package:coshion/app/modules/order/views/on_book_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  final pageC = Get.find<PageIndexController>();
  OrderView({Key? key}) : super(key: key);
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
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text.rich(
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
                        InkWell(
                          onTap: () {
                            Get.to(OnBookView());
                          },
                          child: const Text(
                            'On Book',
                            style: TextStyle(
                              color: Color(0xFF2C3333),
                              fontSize: 16,
                              fontFamily: 'Satoshi',
                              fontWeight: FontWeight.w700,
                            ),
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '7 Day Rent',
                                  style: TextStyle(
                                    color: Color(0xFF2E4F4F),
                                    fontSize: 12,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF0E8388),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(1000),
                                        ),
                                      ),
                                      child: Image.asset(
                                          "assets/icons/minimize.png"),
                                    ),
                                    const SizedBox(width: 10),
                                    const Text(
                                      '2',
                                      style: TextStyle(
                                        color: Color(0xFF2C3333),
                                        fontSize: 14,
                                        fontFamily: 'Satoshi',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF0E8388),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(1000),
                                        ),
                                      ),
                                      child: Image.asset(
                                          "assets/icons/maximize.png"),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
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
                                const Text(
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '7 Day Rent',
                                  style: TextStyle(
                                    color: Color(0xFF2E4F4F),
                                    fontSize: 12,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF0E8388),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(1000),
                                        ),
                                      ),
                                      child: Image.asset(
                                          "assets/icons/minimize.png"),
                                    ),
                                    const SizedBox(width: 10),
                                    const Text(
                                      '2',
                                      style: TextStyle(
                                        color: Color(0xFF2C3333),
                                        fontSize: 14,
                                        fontFamily: 'Satoshi',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF0E8388),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(1000),
                                        ),
                                      ),
                                      child: Image.asset(
                                          "assets/icons/maximize.png"),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
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
                                const Text(
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '7 Day Rent',
                                  style: TextStyle(
                                    color: Color(0xFF2E4F4F),
                                    fontSize: 12,
                                    fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF0E8388),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(1000),
                                        ),
                                      ),
                                      child: Image.asset(
                                          "assets/icons/minimize.png"),
                                    ),
                                    const SizedBox(width: 10),
                                    const Text(
                                      '2',
                                      style: TextStyle(
                                        color: Color(0xFF2C3333),
                                        fontSize: 14,
                                        fontFamily: 'Satoshi',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF0E8388),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(1000),
                                        ),
                                      ),
                                      child: Image.asset(
                                          "assets/icons/maximize.png"),
                                    ),
                                  ],
                                )
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
            Container(
              width: 360,
              height: 120,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x14000000),
                    blurRadius: 28,
                    offset: Offset(4, 0),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 20,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Sub Total',
                                style: TextStyle(
                                  color: Color(0xFF2C3333),
                                  fontSize: 14,
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w700,
                                  height: 0.10,
                                  letterSpacing: 0.42,
                                ),
                              ),
                              const SizedBox(width: 32),
                              Text(
                                'IDR 147.000',
                                style: TextStyle(
                                  color: Color(0xFF0E8388),
                                  fontSize: 14,
                                  fontFamily: 'Satoshi',
                                  fontWeight: FontWeight.w700,
                                  height: 0.10,
                                  letterSpacing: 0.42,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 26, vertical: 12),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF0E8388),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x1E000000),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Proceed to Checkout',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Satoshi',
                            fontWeight: FontWeight.w500,
                            height: 0.08,
                            letterSpacing: 0.48,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
