import 'package:flutter/material.dart';
import 'package:flutter_application_figma_3/data/models/product_model';
import '../widgets/product_card.dart';

class ProductGrid extends StatelessWidget {
  final List<ProductModel> products;

  const ProductGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        mainAxisSpacing: 16, 
        crossAxisSpacing: 16, 
        childAspectRatio: 0.65, 
      ),
      itemBuilder: (context, index) {
        return ProductCard(
          product: products[index],
          onTap: () {},
        );
      },
    );
  }
}
