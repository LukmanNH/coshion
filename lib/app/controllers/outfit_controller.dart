import 'dart:convert';

import 'package:get/get.dart';

class Outfit {
  final int id;
  final String nama;
  final String description;
  final int harga;
  final String gambar;

  Outfit({
    required this.id,
    required this.nama,
    required this.description,
    required this.harga,
    required this.gambar,
  });
}

class OutfitController extends GetxController {
  RxList<Outfit> outfit = <Outfit>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() {
    String jsonString = '''
      [
  {
    "id": 1,
    "nama": "Baju Casual",
    "deskripsi": "Baju santai dengan desain simpel",
    "harga": 150000,
    "warna": "Merah",
    "gambar": "https://source.unsplash.com/800x600/?casual-outfit"
  },
  {
    "id": 2,
    "nama": "Baju Olahraga",
    "deskripsi": "Baju cocok untuk kegiatan olahraga",
    "harga": 120000,
    "warna": "Biru",
    "gambar": "https://source.unsplash.com/800x600/?sportswear"
  },
  {
    "id": 3,
    "nama": "Baju Formal",
    "deskripsi": "Baju cocok untuk acara formal",
    "harga": 200000,
    "warna": "Hitam",
    "gambar": "https://source.unsplash.com/800x600/?formal-wear"
  },
  {
    "id": 4,
    "nama": "Celana Pendek",
    "deskripsi": "Celana cocok untuk nyantai",
    "harga": 150000,
    "warna": "Hitam",
    "gambar": "https://source.unsplash.com/800x600/?short-pants"
  }
]
    ''';

    List<dynamic> jsonData = json.decode(jsonString);
    outfit.assignAll(
      jsonData.map((data) {
        return Outfit(
          id: data['id'],
          nama: data['nama'],
          description: data['deskripsi'],
          harga: data['harga'],
          gambar: data['gambar'],
        );
      }).toList(),
    );
  }
}
