import 'package:challenge_day16/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: const Divider(
                color: Colors.grey,
                thickness: 1.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.all(
                Sizes.size12,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text(
                'or',
                style: TextStyle(
                  fontSize: Sizes.size18,
                  color: Colors.grey,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
