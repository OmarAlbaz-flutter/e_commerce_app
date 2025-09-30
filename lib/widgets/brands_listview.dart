import 'package:flutter/material.dart';
import '../models/brand_model.dart';

class BrandListView extends StatelessWidget {
  BrandListView({super.key});

  final List<BrandModel> brands = [
    BrandModel(name: "Adidas", logo: "assets/images/brands/adidas.png"),
    BrandModel(name: "Nike", logo: "assets/images/brands/nike.png"),
    BrandModel(name: "Fila", logo: "assets/images/brands/fila.png"),
    BrandModel(name: "Puma", logo: "assets/images/brands/puma.png"),
    BrandModel(name: "Gucci", logo: "assets/images/brands/gucci.png"),
    BrandModel(name: "Louis Vuitton", logo: "assets/images/brands/lv.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: brands.length,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(right: 12),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: Image.asset(
                  brands[index].logo,
                  height: 30,
                  width: 30,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                brands[index].name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
