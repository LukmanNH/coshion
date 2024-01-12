import 'package:coshion/app/controllers/outfit_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_outfit_controller.dart';

class DetailOutfitView extends GetView<DetailOutfitController> {
  DetailOutfitView({Key? key}) : super(key: key);
  final outfitService = Get.find<OutfitController>();

  final path = Get.parameters["id"];

  Outfit? getOutfitById(String id) {
    return outfitService.outfit.firstWhere(
      (outfit) => outfit.id == int.parse(id),
      orElse: () => Outfit(
          id: 0,
          nama: "Tidak Ada",
          description: "TIDAK ADA",
          harga: 0,
          gambar: "TIDAK ADA"),
    );
  }

  @override
  Widget build(BuildContext context) {
    final outfitData = getOutfitById(path ?? "");
    return Scaffold(
      appBar: AppBar(
        title: Text(outfitData!.nama),
        centerTitle: true,
      ),
      body: Center(
        child: outfitData != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Nama: ${outfitData.nama}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Deskripsi: ${outfitData.description}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Harga: ${outfitData.harga}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Image.network(outfitData.gambar),
                ],
              )
            : Text(
                'Outfit dengan ID $path tidak ditemukan',
                style: TextStyle(fontSize: 20),
              ),
      ),
    );
  }
}
