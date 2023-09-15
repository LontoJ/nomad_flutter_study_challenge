import 'package:challenge_day16/constants/gaps.dart';
import 'package:challenge_day16/utils/utils.dart';
import 'package:flutter/material.dart';

class ThreadRetweetBox extends StatelessWidget {
  const ThreadRetweetBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundImage: NetworkImage(getRandomImageUrl()),
              ),
              Gaps.h8,
              Text(
                "earthpix",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.h4,
              Icon(
                Icons.verified,
                color: Theme.of(context).primaryColor,
                size: 20,
              )
            ],
          ),
          Gaps.v4,
          Text(
            "What is one place you're absolutely traveling to by next year?",
            style: const TextStyle(),
          ),
        ],
      ),
    );
  }
}
