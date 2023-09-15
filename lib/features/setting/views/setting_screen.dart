import 'package:challenge_day16/features/setting/view_models/setting_view_model.dart';
import 'package:challenge_day16/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  final void Function(int index) handleScreenIndex;

  const SettingsScreen({super.key, required this.handleScreenIndex});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  void _onPrivacyPressed() {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => const PrivacyScreen(),
    //   ),
    // );
    widget.handleScreenIndex(2);
  }

  void _onBackButtonPressed() {
    widget.handleScreenIndex(0);
  }

  @override
  Widget build(
    BuildContext context,
  ) {
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
                    'Settings',
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
                    leading: const Icon(Icons.dark_mode_outlined),
                    title: const Text(
                      "Dark mode",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Switch(
                      value: ref.watch(settingProvider).isDarkMode,
                      onChanged: (value) {
                        ref.read(settingProvider.notifier).setDarkMode(value);
                      },
                    ),
                  ),
                  const ListTile(
                    leading: FaIcon(FontAwesomeIcons.user),
                    title: Text(
                      "Follow and invite friends",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const ListTile(
                    leading: FaIcon(FontAwesomeIcons.bell),
                    title: Text(
                      "Notifications",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.lock_outline),
                    title: const Text(
                      "Privacy",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: _onPrivacyPressed,
                  ),
                  const ListTile(
                    leading: Icon(Icons.account_circle_outlined),
                    title: Text(
                      "Account",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.help_outline),
                    title: Text(
                      "Help",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text(
                      "About",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 0.5,
                  ),
                  ListTile(
                    title: const Text("Log out"),
                    trailing: CupertinoActivityIndicator(
                      radius: 12,
                      color: isDarkMode(context) ? Colors.white : Colors.grey,
                    ),
                    textColor: Theme.of(context).primaryColor,
                    onTap: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) => CupertinoAlertDialog(
                          title: const Text("Are you sure?"),
                          content: const Text("Plx dont go"),
                          actions: [
                            CupertinoDialogAction(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text("No"),
                            ),
                            CupertinoDialogAction(
                              onPressed: () => Navigator.of(context).pop(),
                              isDestructiveAction: true,
                              child: const Text("Yes"),
                            ),
                          ],
                        ),
                      );
                    },
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
