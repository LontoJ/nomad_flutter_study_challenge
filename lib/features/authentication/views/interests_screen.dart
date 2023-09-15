import 'package:challenge_day16/constants/gaps.dart';
import 'package:challenge_day16/constants/sizes.dart';
import 'package:challenge_day16/features/authentication/constants/interests_data.dart';
import 'package:challenge_day16/features/authentication/views/interests_detail_screen.dart';
import 'package:challenge_day16/features/authentication/views/widgets/interest_big_button.dart';
import 'package:challenge_day16/features/common/widgets/buttons/color_button.dart';
import 'package:challenge_day16/features/common/widgets/logos/twitter_logo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InterestsScreen extends StatefulWidget {
  static const routeURL = "/interests";
  static const routeName = "interests";

  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  Set<String> selectedInterests = {};

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void onSelected({required String interest}) {
    print("전달한 문자: $interest");
    setState(() {
      if (!selectedInterests.contains(interest) &&
          selectedInterests.length < 3) {
        selectedInterests.add(interest);
      } else {
        selectedInterests.remove(interest);
      }
    });
    print("selectedInterests: $selectedInterests");
  }

  bool isSelected(interest) {
    return selectedInterests.contains(interest);
  }

  void _goToInterestsDetailScreen(BuildContext context) {
    context.push(InterestsDetailScreen.routeURL,
        extra: {"category": selectedInterests.toList()});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size16,
            ),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size36,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.pop();
                            },
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Transform.translate(
                                offset: const Offset(-Sizes.size16, 0),
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: Sizes.size36,
                                ),
                              ),
                            ),
                          ),
                          const TwitterLogo(),
                        ],
                      ),
                    ),
                    Gaps.v32,
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.size36,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "What do you want to see on Twitter?",
                            style: TextStyle(
                              fontSize: Sizes.size24,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Gaps.v24,
                          Text(
                            "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
                          ),
                        ],
                      ),
                    ),
                    Gaps.v16,
                    const Divider(
                      thickness: 1,
                      color: Colors.black12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size36,
                      ),
                      child: SizedBox(
                        height: 380,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Wrap(
                                  runSpacing: 15,
                                  spacing: 15,
                                  children: [
                                    for (var interest in INTERESTS_DATA.keys)
                                      InterestBigButton(
                                        interest: interest,
                                        isSelected: isSelected(interest),
                                        onSelected: onSelected,
                                      )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.black12,
                width: 1.0,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: Sizes.size36,
              right: Sizes.size36,
              top: Sizes.size16,
              bottom: Sizes.size36,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedInterests.length < 3
                          ? "${selectedInterests.length} of 3 selected"
                          : "Great work 🎉",
                      style: const TextStyle(
                        fontSize: Sizes.size16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      height: 60,
                      child: ColorButton(
                        text: "Next",
                        isDisabled: selectedInterests.length < 3,
                        onPressed: _goToInterestsDetailScreen,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
