import 'package:flutter/material.dart';
import 'package:flutter_application_figma_3/data/models/product_model';
import 'package:flutter_svg/svg.dart';
import '../screens/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard(
      {super.key, required this.product, required Null Function() onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(product: product),
          ),
        );
      },
      child: Container(
        width: 180,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: "product_${product.id}",
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.network(
                      product.imageUrl,
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(
                      "assets/icons/heart.svg",
                      width: 20,
                      height: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),

            Transform.translate(
              offset: const Offset(0, -20),
              child: CircleAvatar(
                radius: 26,
                backgroundColor: const Color(0xFF061023),
                child: SvgPicture.asset(
                  "assets/icons/bag-2.svg",
                  width: 24,
                  height: 24,
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                product.name,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF061023),
                ),
              ),
            ),

            const SizedBox(height: 4),

            Text(
              "\$${product.price}",
              style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF061023),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
