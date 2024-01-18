import 'package:coshion/app/constant/color.dart';
import 'package:coshion/app/controllers/outfit_controller.dart';
import 'package:coshion/app/widgets/customButton.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_outfit_controller.dart';

class DetailOutfitView extends GetView<DetailOutfitController> {
  DetailOutfitView({Key? key}) : super(key: key);
  // final outfitService = Get.find<OutfitController>();

  // final path = Get.parameters["id"];

  // Outfit? getOutfitById(String id) {
  //   return outfitService.outfit.firstWhere(
  //     (outfit) => outfit.id == int.parse(id),
  //     orElse: () => Outfit(
  //         id: 0,
  //         nama: "Tidak Ada",
  //         description: "TIDAK ADA",
  //         harga: 0,
  //         gambar: "TIDAK ADA"),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // final outfitData = getOutfitById(path ?? "");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
          style: textStylePrimary.copyWith(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 320,
                  decoration: const BoxDecoration(
                    color: Color(0xFFD9D9D9),
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                width: 55,
                                height: 53,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 1)),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Container(
                                width: 55,
                                height: 53,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 1)),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Container(
                                width: 55,
                                height: 53,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 1)),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Container(
                                width: 55,
                                height: 53,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 1)),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Container(
                                width: 55,
                                height: 53,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 1)),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Container(
                                width: 55,
                                height: 53,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 1)),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Container(
                                width: 55,
                                height: 53,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 1)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Product",
                          style: textStylePrimary.copyWith(fontSize: 27),
                        ),
                        Text(
                          "Available in Stock",
                          style: textStyleSecondary.copyWith(fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "By Store Name",
                          style: textStylePrimary.copyWith(fontSize: 13),
                        ),
                        Text(
                          "IDR 50.000",
                          style: textStyleSecondary.copyWith(fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "4.6/5.0 (100 Reviews)",
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      width: double.infinity,
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      "Colour: Black",
                      style: textStyleSecondary.copyWith(fontSize: 15),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Container(
                          width: 19,
                          height: 19,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF82C7D1),
                            shape: OvalBorder(),
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        Container(
                          width: 19,
                          height: 19,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF82C7D1),
                            shape: OvalBorder(),
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        Container(
                          width: 19,
                          height: 19,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF82C7D1),
                            shape: OvalBorder(),
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        Container(
                          width: 19,
                          height: 19,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF82C7D1),
                            shape: OvalBorder(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        Container(
                          width: 29,
                          height: 25,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Center(
                            child: Text("XS"),
                          ),
                        ),
                        const SizedBox(width: 9.0),
                        Container(
                          width: 29,
                          height: 25,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Center(
                            child: Text("S"),
                          ),
                        ),
                        const SizedBox(width: 9.0),
                        Container(
                          width: 29,
                          height: 25,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Center(
                            child: Text("M"),
                          ),
                        ),
                        const SizedBox(width: 9.0),
                        Container(
                          width: 29,
                          height: 25,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Center(
                            child: Text("L"),
                          ),
                        ),
                        const SizedBox(width: 9.0),
                        Container(
                          width: 29,
                          height: 25,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Center(
                            child: Text("XL"),
                          ),
                        ),
                        const SizedBox(width: 9.0),
                      ],
                    ),
                    const SizedBox(height: 25.0),
                    const Text(
                      "Product Details",
                      style: textStylePrimary,
                    )
                  ],
                ),
              ],
            ),
          ),
          Align(
            child: Container(
              width: double.infinity,
              height: 120,
              decoration: const BoxDecoration(
                color: Color(0xFFD9D9D9),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 25, bottom: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("QTY"),
                        Text("Total IDR 50.000"),
                      ],
                    ),
                    Container(
                      width: 307,
                      height: 36,
                      decoration: ShapeDecoration(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Add To Cart",
                          style: textStylePrimary.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
