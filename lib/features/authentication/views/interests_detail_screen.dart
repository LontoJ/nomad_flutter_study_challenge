import 'package:challenge_day16/constants/gaps.dart';
import 'package:challenge_day16/constants/sizes.dart';
import 'package:challenge_day16/features/authentication/constants/interests_data.dart';
import 'package:challenge_day16/features/authentication/view_models/signup_view_model.dart';
import 'package:challenge_day16/features/authentication/views/widgets/interest_button.dart';
import 'package:challenge_day16/features/common/widgets/buttons/color_button.dart';
import 'package:challenge_day16/features/common/widgets/logos/twitter_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class InterestsDetailScreen extends ConsumerStatefulWidget {
  static const routeURL = "/interests_detail";
  static const routeName = "interests_detail";
  final Map<String, List<String>>? object;

  const InterestsDetailScreen({super.key, this.object});

  @override
  ConsumerState<InterestsDetailScreen> createState() =>
      _InterestsDetailScreenState();
}

class _InterestsDetailScreenState extends ConsumerState<InterestsDetailScreen> {
  Set<String> selectedInterests = {};

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _goToMainNavigation(BuildContext context) {
    ref.read(signUpProvider.notifier).signUp(context);
  }

  void onSelected({required String interest}) {
    setState(() {
      if (!selectedInterests.contains(interest)) {
        selectedInterests.add(interest);
      } else {
        selectedInterests.remove(interest);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> categories = widget.object?["category"] ?? [];

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
                            "Interests are used to personalize your experience and will be visible on your profile.",
                          ),
                        ],
                      ),
                    ),
                    Gaps.v16,
                    const Divider(
                      thickness: 1,
                      color: Colors.black12,
                    ),
                    SizedBox(
                      height: 380,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: categories.map((category) {
                              List<String> details =
                                  INTERESTS_DATA[category] ?? [];
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: Sizes.size36,
                                    ),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        category,
                                        style: const TextStyle(
                                          fontSize: Sizes.size20,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gaps.v28,
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: Sizes.size36,
                                      ),
                                      width: MediaQuery.of(context).size.width *
                                          1.7,
                                      child: Wrap(
                                        direction: Axis.horizontal,
                                        runSpacing: 15,
                                        spacing: 15,
                                        children: [
                                          for (var detail in details)
                                            InterestButton(
                                              interest: detail,
                                              isSelected: selectedInterests
                                                  .contains(detail),
                                              onSelected: onSelected,
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 18.0),
                                    child: Divider(
                                      thickness: 1,
                                      color: Colors.black12,
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
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
                FractionallySizedBox(
                  widthFactor: 0.4,
                  child: ColorButton(
                    text: "Next",
                    isDisabled: selectedInterests.length < 3 ||
                        ref.watch(signUpProvider).isLoading,
                    onPressed: _goToMainNavigation,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
