import 'package:challenge_day16/constants/sizes.dart';
import 'package:flutter/material.dart';

class InterestBigButton extends StatefulWidget {
  final bool isSelected;
  final void Function({required String interest}) onSelected;

  const InterestBigButton({
    Key? key,
    required this.interest,
    required this.isSelected,
    required this.onSelected,
  }) : super(key: key);

  final String interest;

  @override
  State<InterestBigButton> createState() => _InterestBigButtonState();
}

class _InterestBigButtonState extends State<InterestBigButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelected(interest: widget.interest);
      },
      child: AnimatedContainer(
        width: 150,
        height: 80,
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size8,
          horizontal: Sizes.size16,
        ),
        decoration: BoxDecoration(
          color:
              widget.isSelected ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(
            Sizes.size10,
          ),
          border: Border.all(
            color: Colors.black.withOpacity(0.1),
          ),
        ),
        child: Stack(
          children: [
            Visibility(
              visible: widget.isSelected,
              child: const Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.check_circle,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                widget.interest,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: widget.isSelected ? Colors.white : Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
