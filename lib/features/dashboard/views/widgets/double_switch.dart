import 'package:challenge_day16/constants/sizes.dart';
import 'package:flutter/material.dart';

class DoubleSwitch extends StatelessWidget {
  final String topText;
  final String bottomText;
  final Function? onTap;

  const DoubleSwitch({
    super.key,
    required this.topText,
    required this.bottomText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(Sizes.size20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  topText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          Divider(
            thickness: 0.5,
          ),
          Expanded(
            child: GestureDetector(
              onTap: (bottomText == "Report" || onTap != null)
                  ? () => onTap!()
                  : null,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    bottomText,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: bottomText == "Report" ? Colors.red : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
