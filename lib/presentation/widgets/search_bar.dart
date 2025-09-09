import 'package:flutter/material.dart';

class SearchBarWidet extends StatelessWidget {
  const SearchBarWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: TextField(
        decoration: InputDecoration(
          hintText: "What are you looking for...",
          // ignore: prefer_const_constructors
          hintStyle: TextStyle(
            fontSize: 15, 
            fontWeight: FontWeight.w200, 
            color: const Color(0xFF4F5663), 
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(
                10.0), 
            child: Image.asset(
              "assets/icons/search.png",
              width: 30,
              height: 30,
            ),
          ),
          filled: true,
          fillColor: const Color(0xFFF6F6F6),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
