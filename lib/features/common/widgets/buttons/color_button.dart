import 'package:challenge_day16/constants/sizes.dart';
import 'package:flutter/material.dart';

class ColorButton extends StatelessWidget {
  final String text;
  final void Function(BuildContext context) onPressed;
  final bool isDisabled;
  final Color color;

  const ColorButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isDisabled = false,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => isDisabled ? null : onPressed(context),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(
              vertical: Sizes.size18, horizontal: Sizes.size32),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: isDisabled ? Colors.grey.shade600 : color,
          ),
          duration: Duration(milliseconds: 500),
          child: AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 500),
            style: TextStyle(
              fontSize: Sizes.size18,
              fontWeight: FontWeight.w800,
              color: isDisabled ? Colors.grey.shade300 : Colors.white,
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
