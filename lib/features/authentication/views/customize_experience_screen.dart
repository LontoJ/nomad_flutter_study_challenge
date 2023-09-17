import 'package:challenge_day16/constants/gaps.dart';
import 'package:challenge_day16/constants/sizes.dart';
import 'package:challenge_day16/features/authentication/views/create_account_final_screen.dart';
import 'package:challenge_day16/features/common/widgets/buttons/color_button.dart';
import 'package:challenge_day16/features/common/widgets/logos/twitter_logo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomizeExperienceScreen extends StatefulWidget {
  static const routeURL = "/customize_experience";
  static const routeName = "customize_experience";

  const CustomizeExperienceScreen({
    super.key,
  });

  @override
  State<CustomizeExperienceScreen> createState() =>
      _CustomizeExperienceScreenState();
}

class _CustomizeExperienceScreenState extends State<CustomizeExperienceScreen> {
  bool _isAgreed = false;

  void onChanged(bool value) {
    setState(() {
      _isAgreed = value;
    });
  }

  void _goToCreateAccountFinal(BuildContext context) {
    context.push(CreateAccountFinalScreen.routeURL);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
            vertical: Sizes.size16,
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
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
                    Gaps.v32,
                    const Text(
                      "Customize your\nexperience",
                      style: TextStyle(
                        fontSize: Sizes.size28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Gaps.v32,
                    const Text(
                      "Track where you see Twitter\ncontent across the web",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Gaps.v28,
                    Row(
                      children: [
                        const Flexible(
                          flex: 4,
                          child: Text(
                            "Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.",
                            style: TextStyle(
                              fontSize: Sizes.size18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Switch(
                            value: _isAgreed,
                            onChanged: onChanged,
                            activeColor: Colors.white,
                            activeTrackColor: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    Gaps.v28,
                    RichText(
                      text: TextSpan(
                        text: "By signing up, you agree to our ",
                        style: const TextStyle(
                          fontSize: Sizes.size14,
                          color: Colors.grey,
                        ),
                        children: [
                          TextSpan(
                            text: "Terms",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const TextSpan(
                            text: ",\n",
                          ),
                          TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const TextSpan(
                            text: ", and ",
                          ),
                          TextSpan(
                            text: "Cookie Use",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const TextSpan(
                            text:
                                ". Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy.",
                          ),
                          TextSpan(
                            text: " Learn more",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: ColorButton(
                        text: "Next",
                        isDisabled: !_isAgreed,
                        onPressed: _goToCreateAccountFinal,
                      ),
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
