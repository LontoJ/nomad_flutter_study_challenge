import 'package:challenge_day16/constants/sizes.dart';
import 'package:challenge_day16/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CustomTab({super.key, required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 120,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isDarkMode(context) ? Colors.grey.shade500 : Colors.black26,
          ),
          color: isSelected
              ? isDarkMode(context)
                  ? Colors.white
                  : Colors.black
              : Colors.transparent,
        ),
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: TextStyle(
              color: isSelected
                  ? isDarkMode(context)
                      ? Colors.black
                      : Colors.white
                  : isDarkMode(context)
                      ? Colors.white
                      : Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size18,
            ),
            child: Text(
              title,
            ),
          ),
        ),
      ),
    );
  }
}
