import 'package:challenge_day16/constants/sizes.dart';
import 'package:flutter/material.dart';

class InterestButton extends StatefulWidget {
  final bool isSelected;
  final void Function({required String interest}) onSelected;

  const InterestButton({
    Key? key,
    required this.interest,
    required this.isSelected,
    required this.onSelected,
  }) : super(key: key);

  final String interest;

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelected(interest: widget.interest);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
          horizontal: Sizes.size24,
        ),
        decoration: BoxDecoration(
          color:
          widget.isSelected ? Theme
              .of(context)
              .primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(
            Sizes.size32,
          ),
          border: Border.all(
            color: Colors.black.withOpacity(0.1),
          ),


        ),
        child: Text(
          widget.interest,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: widget.isSelected ? Colors.white : Colors.black87),
        ),
      ),
    );
  }
}
