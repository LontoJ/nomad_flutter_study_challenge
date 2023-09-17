import 'package:challenge_day16/constants/gaps.dart';
import 'package:challenge_day16/constants/sizes.dart';
import 'package:challenge_day16/features/authentication/views/create_account_screen.dart';
import 'package:challenge_day16/features/authentication/views/login_screen.dart';
import 'package:challenge_day16/features/authentication/views/widgets/custom_divider.dart';
import 'package:challenge_day16/features/common/widgets/buttons/color_button.dart';
import 'package:challenge_day16/features/common/widgets/buttons/logo_border_button.dart';
import 'package:challenge_day16/features/common/widgets/logos/twitter_logo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class InitialScreen extends StatelessWidget {
  static const routeURL = "/initial";
  static const routeName = "initial";

  const InitialScreen({super.key});

  void _goToCreateAccount(BuildContext context) {
    context.push(CreateAccountScreen.routeURL);
  }

  void _goToLoginScreen(BuildContext context) {
    context.push(LoginScreen.routeURL);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size24,
            vertical: Sizes.size16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TwitterLogo(),
                ],
              ),
              Gaps.v96,
              const Text(
                "See what's happening\nin the world right now.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gaps.v96,
              const LogoBorderButton(
                text: "Continue with Google",
                icon: FaIcon(
                  FontAwesomeIcons.google,
                  size: Sizes.size28,
                  color: Colors.black,
                ),
              ),
              Gaps.v20,
              const LogoBorderButton(
                text: "Continue with Apple",
                icon: FaIcon(
                  FontAwesomeIcons.apple,
                  size: Sizes.size32,
                  color: Colors.black,
                ),
              ),
              const CustomDivider(),
              ColorButton(
                text: 'Create account',
                onPressed: _goToCreateAccount,
              ),
              Gaps.v24,
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
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
                        text: ".",
                      ),
                    ],
                  ),
                ),
              ),
              Gaps.v32,
              GestureDetector(
                onTap: () {
                  _goToLoginScreen(context);
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      text: "Have an account already? ",
                      style: const TextStyle(
                        fontSize: Sizes.size14,
                        color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: "Log in",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
