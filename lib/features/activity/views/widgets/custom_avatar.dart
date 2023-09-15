import 'package:challenge_day16/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(getRandomImageUrl()),
          ),
          Positioned(
            right: -8,
            bottom: -8,
            child: CircleAvatar(
              radius: 14,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 12,
                backgroundImage: NetworkImage(getRandomImageUrl()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
