import 'package:challenge_day16/constants/gaps.dart';
import 'package:challenge_day16/features/dashboard/views/widgets/option_sheet.dart';
import 'package:challenge_day16/features/profile/views/widgets/thread_retweet_box.dart';
import 'package:challenge_day16/utils/utils.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThreadBox extends StatefulWidget {
  final String username;

  final String text;
  final String timeAgo;

  const ThreadBox({
    super.key,
    required this.username,
    required this.text,
    required this.timeAgo,
  });

  @override
  State<ThreadBox> createState() => _ThreadBoxState();
}

class _ThreadBoxState extends State<ThreadBox> {
  void _onOptionTap(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const OptionSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(getRandomImageUrl()),
                    ),
                  ],
                ),
                Gaps.h16,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                widget.username,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                widget.timeAgo,
                                style: TextStyle(
                                  color: isDarkMode(context)
                                      ? Colors.grey.shade500
                                      : Colors.black38,
                                ),
                              ),
                              Gaps.h12,
                              GestureDetector(
                                onTap: () => _onOptionTap(context),
                                child: FaIcon(
                                  FontAwesomeIcons.ellipsis,
                                  size: 16,
                                  color: isDarkMode(context)
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Gaps.v4,
                      Text(
                        widget.text,
                        style: const TextStyle(),
                      ),
                      Gaps.v8,
                      Faker().randomGenerator.boolean()
                          ? const ThreadRetweetBox()
                          : const SizedBox(),
                      Gaps.v16,
                      Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: 20,
                            color: isDarkMode(context)
                                ? Colors.white
                                : Colors.black,
                          ),
                          Gaps.h10,
                          FaIcon(
                            FontAwesomeIcons.comment,
                            size: 20,
                            color: isDarkMode(context)
                                ? Colors.white
                                : Colors.black,
                          ),
                          Gaps.h10,
                          FaIcon(
                            FontAwesomeIcons.retweet,
                            size: 20,
                            color: isDarkMode(context)
                                ? Colors.white
                                : Colors.black,
                          ),
                          Gaps.h10,
                          FaIcon(
                            FontAwesomeIcons.paperPlane,
                            size: 20,
                            color: isDarkMode(context)
                                ? Colors.white
                                : Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
