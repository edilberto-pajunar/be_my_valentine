import 'package:be_my_valentine/core/constants/strings/image.dart';
import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Stack(
        children: [
          Image.asset(
            PngImages.cover,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: kToolbarHeight,
            width: double.infinity,
            color: Colors.black.withOpacity(0.3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Text("TV Shows"),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text("TV Shows"),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text("TV Shows"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
