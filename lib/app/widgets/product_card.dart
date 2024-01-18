import 'package:coshion/app/constant/color.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final bool isLiked;
  const ProductCard({super.key, required this.image, required this.isLiked});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(image),
              Padding(
                padding: EdgeInsets.only(top: 4, right: 10),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(isLiked ? Icons.favorite : Icons.favorite_border,
                      color: colorPrimary),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "Jaket Klemin Berlin",
            style: textStylePrimary.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            "IDR 32.000",
            style: textStyleSecondary.copyWith(color: const Color(0xFF0E8388)),
          ),
        ],
      ),
    );
  }
}
