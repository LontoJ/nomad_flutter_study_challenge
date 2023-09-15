import 'package:challenge_day16/constants/gaps.dart';
import 'package:challenge_day16/features/activity/views/widgets/custom_avatar.dart';
import 'package:challenge_day16/features/activity/views/widgets/custom_tab.dart';
import 'package:challenge_day16/utils/utils.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: 4,
    vsync: this,
  );

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    // 리스너 추가
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _selectedIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Activity",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Gaps.v16,
              TabBar(
                controller: _tabController,
                splashFactory: NoSplash.splashFactory,
                isScrollable: true,
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                labelPadding: EdgeInsets.symmetric(horizontal: 4.0),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                tabs: [
                  CustomTab(
                    title: "All",
                    isSelected: _selectedIndex == 0,
                  ),
                  CustomTab(
                    title: "Mentions",
                    isSelected: _selectedIndex == 1,
                  ),
                  CustomTab(
                    title: "Follows",
                    isSelected: _selectedIndex == 2,
                  ),
                  CustomTab(
                    title: "Favorites",
                    isSelected: _selectedIndex == 3,
                  ),
                ],
              ),
              Gaps.v16,
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    for (int i = 0; i < 4; i++)
                      ListView(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        children: [
                          for (int i = 0; i < 10; i++)
                            IntrinsicHeight(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    minVerticalPadding: 0,
                                    leading: CustomAvatar(),
                                    title: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            faker.person.name(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Gaps.h8,
                                        Text(
                                          "${faker.randomGenerator.integer(23, min: 1)}h",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade500,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    subtitle: Text(
                                      faker.company.name(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade500,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Transform.translate(
                                    offset: const Offset(0, -10),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 72.0,
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              faker.lorem.sentence(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          faker.randomGenerator.boolean()
                                              ? Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 18.0),
                                                  child: Container(
                                                    width: 100,
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                        color: Colors
                                                            .grey.shade400,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "Following",
                                                        style: TextStyle(
                                                          color: isDarkMode(
                                                                  context)
                                                              ? Colors
                                                                  .grey.shade500
                                                              : Colors.black38,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : SizedBox(
                                                  width: 50,
                                                ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.grey.shade300,
                                    thickness: 1,
                                    indent: 72,
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
