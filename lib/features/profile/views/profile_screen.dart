import 'package:challenge_day16/constants/gaps.dart';
import 'package:challenge_day16/constants/sizes.dart';
import 'package:challenge_day16/features/dashboard/views/widgets/comment_avartar.dart';
import 'package:challenge_day16/features/profile/views/widgets/persistent_tabbar.dart';
import 'package:challenge_day16/features/profile/views/widgets/thread_box.dart';
import 'package:challenge_day16/features/setting/views/privacy_screen.dart';
import 'package:challenge_day16/features/setting/views/setting_screen.dart';
import 'package:challenge_day16/utils/utils.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  final int selectedIndex;

  const ProfileScreen({super.key, required this.selectedIndex});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedIndex = widget.selectedIndex;
    });
  }

  void handleScreenIndex(int index) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => const SettingsScreen(),
    //   ),
    // );
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      context.go("/settings");
    } else if (index == 2) {
      context.go("/settings/privacy");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _selectedIndex == 0
          ? DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                stretch: true,
                leading: IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.earthAsia,
                    size: Sizes.size24,
                    color:
                    isDarkMode(context) ? Colors.white : Colors.black,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: FaIcon(
                      FontAwesomeIcons.instagram,
                      size: Sizes.size28,
                      color: isDarkMode(context)
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () => handleScreenIndex(1),
                    icon: FaIcon(
                      FontAwesomeIcons.bars,
                      size: Sizes.size24,
                      color: isDarkMode(context)
                          ? Colors.white
                          : Colors.black,
                    ),
                  )
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Jane",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.size24,
                                ),
                              ),
                              Gaps.v8,
                              Row(
                                children: [
                                  const Text(
                                    "jane_mobbin",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: Sizes.size14,
                                    ),
                                  ),
                                  Gaps.h4,
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: Sizes.size8,
                                      vertical: Sizes.size4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius:
                                      const BorderRadius.all(
                                        Radius.circular(Sizes.size10),
                                      ),
                                    ),
                                    child: Text(
                                      Faker().person.name(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade500,
                                        fontSize: Sizes.size12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Gaps.v8,
                              Text(
                                Faker().person.name(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: Sizes.size14,
                                ),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 40,
                            foregroundImage:
                            NetworkImage(getRandomImageUrl()),
                          ),
                        ],
                      ),
                      Gaps.v20,
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: CommentAvatar(
                              commentCount: 2,
                            ),
                          ),
                          Text(
                            "2 followers",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade500,
                              fontSize: Sizes.size14,
                            ),
                          ),
                        ],
                      ),
                      Gaps.v20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width:
                            MediaQuery
                                .of(context)
                                .size
                                .width * 0.4,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "Edit Profile",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Gaps.h16,
                          Container(
                            width:
                            MediaQuery
                                .of(context)
                                .size
                                .width * 0.4,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "Share Profile",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gaps.v20,
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              ListView.separated(
                itemCount: 20,
                separatorBuilder: (context, index) =>
                const Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 30,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 10,
                ),
                itemBuilder: (context, index) =>
                const Column(
                  children: [
                    ThreadBox(
                      username: 'jane_mobbin',
                      text: 'Tea. Spillage.',
                      timeAgo: '5h',
                    ),
                  ],
                ),
              ),
              ListView.separated(
                itemCount: 20,
                separatorBuilder: (context, index) =>
                const Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 30,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 10,
                ),
                itemBuilder: (context, index) =>
                const Column(
                  children: [
                    ThreadBox(
                      username: 'jane_mobbin',
                      text: 'Tea. Spillage.',
                      timeAgo: '5h',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
          : _selectedIndex == 1
          ? SettingsScreen(handleScreenIndex: handleScreenIndex)
          : PrivacyScreen(handleScreenIndex: handleScreenIndex),
    );
  }
}
