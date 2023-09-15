import 'package:challenge_day16/constants/gaps.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrivacyScreen extends StatefulWidget {
  final void Function(int index) handleScreenIndex;

  const PrivacyScreen({super.key, required this.handleScreenIndex});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _notifications = false;

  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  void _onBackButtonPressed() {
    widget.handleScreenIndex(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _onBackButtonPressed();
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.chevron_left, size: 32),
                      Text(
                        'Back',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Privacy',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 0.5,
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.lock_outline),
                    title: const Text(
                      "Private profile",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Switch(
                      value: _notifications,
                      onChanged: _onNotificationsChanged,
                    ),
                  ),
                  ListTile(
                    leading: const FaIcon(
                      FontAwesomeIcons.at,
                      size: 20,
                    ),
                    title: const Text(
                      "Mentions",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Everyone",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade500,
                            fontSize: 16,
                          ),
                        ),
                        Gaps.h8,
                        Icon(
                          Icons.chevron_right,
                          size: 34,
                          color: Colors.grey.shade500,
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const FaIcon(
                      FontAwesomeIcons.bellSlash,
                      size: 20,
                    ),
                    title: const Text(
                      "Mute",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      size: 34,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  ListTile(
                    leading: const FaIcon(
                      FontAwesomeIcons.eyeSlash,
                      size: 20,
                    ),
                    title: const Text(
                      "Hidden Words",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      size: 34,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.supervised_user_circle_outlined),
                    title: const Text(
                      "Profiles you follow",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      size: 34,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const Divider(
                    thickness: 0.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 30,
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text(
                            "Other privacy settings",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Icon(
                            Icons.ios_share_outlined,
                            size: 24,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        const Text(
                          "Some settings, like restrict, apply to both Threads and Insteagram and can be managed on Instagram.",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(
                      left: 24,
                      right: 30,
                    ),
                    leading: const Icon(Icons.block_outlined),
                    title: const Text(
                      "Blocked profiles",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Icon(
                      Icons.ios_share_outlined,
                      size: 24,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(
                      left: 24,
                      right: 30,
                    ),
                    leading: const Icon(Icons.heart_broken_outlined),
                    title: const Text(
                      "Hide likes",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Icon(
                      Icons.ios_share_outlined,
                      size: 24,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
