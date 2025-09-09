import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(215, 217, 217, 217),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Shop wit us!",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF061023))),
                  const SizedBox(height: 10),
                  const Text(
                    "Get 40% Off for all iteams",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Shop Now",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF061023),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 6),
                      SvgPicture.asset(
                        "assets/icons/dir.svg", 
                        width: 30,
                        height: 16,
                        // ignore: deprecated_member_use
                        color: Colors.black,
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/icons/man.png",
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
