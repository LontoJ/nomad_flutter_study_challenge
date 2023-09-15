import 'package:challenge_day16/constants/gaps.dart';
import 'package:challenge_day16/features/common/widgets/logos/twitter_logo.dart';
import 'package:challenge_day16/features/dashboard/views/widgets/post_box.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {


  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TwitterLogo(),
              Gaps.v24,
              PostBox(
                username: "pubity",
                isVerified: true,
                text: "Vine after seeing the Threads logo unveiled",
                timeAgo: "2m",
                likes: 391,
                comments: 53,
                imageCount: 10,
              ),
              Divider(
                height: 50,
                thickness: 0.5,
              ),
              PostBox(
                username: "thetinderblog",
                isVerified: false,
                text: "Elon alone on Twitter right now...",
                timeAgo: "3m",
                likes: 91,
                comments: 2,
                imageCount: 5,
              ),
              Divider(
                height: 50,
                thickness: 0.5,
              ),
              PostBox(
                username: "tropicalseductions",
                isVerified: true,
                text: "Drop a comment here to test things out.",
                timeAgo: "2h",
                likes: 4,
                comments: 5,
                imageCount: 0,
              ),
              Divider(
                height: 50,
                thickness: 0.5,
              ),
              PostBox(
                username: "shityoushouldcareabout",
                isVerified: false,
                text:
                "my phone feels like a vibrator with all these notifications rn",
                timeAgo: "2h",
                likes: 4,
                comments: 1,
                imageCount: 0,
              ),
              Divider(
                height: 50,
                thickness: 0.5,
              ),
              PostBox(
                username: "terracottacoco",
                isVerified: true,
                text: "",
                timeAgo: "2h",
                likes: 4,
                comments: 2,
                imageCount: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
