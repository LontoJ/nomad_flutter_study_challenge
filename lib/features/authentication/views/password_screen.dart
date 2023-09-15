import 'package:challenge_day16/constants/gaps.dart';
import 'package:challenge_day16/constants/sizes.dart';
import 'package:challenge_day16/features/authentication/views/interests_screen.dart';
import 'package:challenge_day16/features/common/widgets/buttons/color_button.dart';
import 'package:challenge_day16/features/common/widgets/logos/twitter_logo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class PasswordScreen extends StatefulWidget {
  static const routeURL = "/password";
  static const routeName = "password";

  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";

  bool _obscureText = true;
  bool _isPasswordValid = false;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      print(_isPasswordValid);
      setState(() {
        _password = _passwordController.text;
        _isPasswordValid = _password.isNotEmpty && _password.length > 8;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _goToInterestsScreen(BuildContext context) {
    context.push(
      InterestsScreen.routeURL,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size36,
              vertical: Sizes.size16,
            ),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
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
                          "You'll need a password",
                          style: TextStyle(
                            fontSize: Sizes.size24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Gaps.v24,
                        const Text(
                          "Make sure it's 8 characters or more.",
                        ),
                        Gaps.v64,
                        TextField(
                          controller: _passwordController,
                          obscureText: _obscureText,
                          autocorrect: false,
                          decoration: InputDecoration(
                            suffix: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: _toggleObscureText,
                                  child: FaIcon(
                                    _obscureText
                                        ? FontAwesomeIcons.eye
                                        : FontAwesomeIcons.eyeSlash,
                                    color: Colors.grey.shade500,
                                    size: Sizes.size20,
                                  ),
                                ),
                                Gaps.h6,
                                _isPasswordValid
                                    ? const Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                        size: 26,
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(
                              fontSize: Sizes.size18,
                              color: Colors.grey.shade700,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ),
                          cursorColor: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ColorButton(
                        text: "Next",
                        isDisabled: !_isPasswordValid,
                        onPressed: _goToInterestsScreen,
                      ),
                    ],
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
