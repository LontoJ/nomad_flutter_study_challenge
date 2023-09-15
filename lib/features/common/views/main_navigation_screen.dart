import 'package:challenge_day16/constants/sizes.dart';
import 'package:challenge_day16/features/activity/views/activity_screen.dart';
import 'package:challenge_day16/features/common/widgets/nav_tab.dart';
import 'package:challenge_day16/features/dashboard/views/dashboard_screen.dart';
import 'package:challenge_day16/features/profile/views/profile_screen.dart';
import 'package:challenge_day16/features/search/views/search_screen.dart';
import 'package:challenge_day16/features/write/views/write_screen.dart';
import 'package:challenge_day16/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MainNavigationScreen extends StatefulWidget {
  static const String routeURL = "/";
  static const String routeName = "main_navigation";
  final String tab;

  const MainNavigationScreen({
    super.key,
    required this.tab,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<String> _tabs = [
    "dashboard",
    "search",
    "write",
    "activity",
    "profile",
    "settings",
    "privacy",
  ];

  @override
  void initState() {
    super.initState();
    _setInitialTabIndex();
  }

  void _setInitialTabIndex() {
    int initialIndex = _tabs.indexOf(widget.tab);
    if (initialIndex != -1 || initialIndex != 2) {
      if (initialIndex == 5) {
        _selectedIndex = 4;
      } else if ((initialIndex == 6)) {
        _selectedIndex = 4;
      } else {
        print("initialIndex: $initialIndex");
        _selectedIndex = initialIndex;
      }
    }
  }

  int _selectedIndex = 0;

  void _onTap(int index) {
    if (index == 2) {
      _goToWriteScreen(context);
      return;
    }
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      context.go("/");
    } else {
      context.go("/${_tabs[index]}");
    }
  }

  void _goToWriteScreen(BuildContext context) {
    context.push(
      WriteScreen.routeURL,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const DashboardScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const SearchScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: const Center(
              child: Text("Write"),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const ActivityScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: ProfileScreen(
              selectedIndex: widget.tab == "settings"
                  ? 1
                  : widget.tab == "privacy"
                      ? 2
                      : 0,
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color:
                  isDarkMode(context) ? Colors.grey.shade900 : Colors.black12,
              width: 1.0,
            ),
          ),
        ),
        padding: const EdgeInsets.only(
          top: Sizes.size12,
          bottom: Sizes.size28,
        ),
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTab(
                isSelected: _selectedIndex == 0,
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.house,
                onTap: () => _onTap(0),
                selectedIndex: _selectedIndex,
              ),
              NavTab(
                isSelected: _selectedIndex == 1,
                icon: FontAwesomeIcons.magnifyingGlass,
                selectedIcon: FontAwesomeIcons.magnifyingGlass,
                onTap: () => _onTap(1),
                selectedIndex: _selectedIndex,
              ),
              NavTab(
                isSelected: _selectedIndex == 2,
                icon: FontAwesomeIcons.penToSquare,
                selectedIcon: FontAwesomeIcons.solidPenToSquare,
                onTap: () => _onTap(2),
                selectedIndex: _selectedIndex,
              ),
              NavTab(
                isSelected: _selectedIndex == 3,
                icon: FontAwesomeIcons.heart,
                selectedIcon: FontAwesomeIcons.solidHeart,
                onTap: () => _onTap(3),
                selectedIndex: _selectedIndex,
              ),
              NavTab(
                isSelected: _selectedIndex == 4,
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                onTap: () => _onTap(4),
                selectedIndex: _selectedIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
