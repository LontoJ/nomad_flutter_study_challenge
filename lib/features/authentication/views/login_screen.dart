import 'package:challenge_day16/constants/gaps.dart';
import 'package:challenge_day16/constants/sizes.dart';
import 'package:challenge_day16/features/authentication/view_models/login_view_model.dart';
import 'package:challenge_day16/features/common/widgets/buttons/color_button.dart';
import 'package:challenge_day16/features/common/widgets/logos/twitter_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeURL = "/login";
  static const routeName = "login";

  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _email = "";
  String _password = "";

  bool _obscureText = true;
  bool _isPasswordValid = false;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _email = _emailController.text;
        _password = _passwordController.text;
        _isPasswordValid = _password.isNotEmpty && _password.length > 8;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
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

  void _login(BuildContext context) {
    ref.read(loginProvider.notifier).login(
          _email,
          _password,
          context,
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
                          "Log in to Twitter",
                          style: TextStyle(
                            fontSize: Sizes.size24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Gaps.v24,
                        TextField(
                          controller: _emailController,
                          autocorrect: false,
                          decoration: InputDecoration(
                            labelText: "Email",
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
                        Gaps.v32,
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
                        text: "Log in",
                        isDisabled: !_isPasswordValid ||
                            _email.isEmpty ||
                            ref.watch(loginProvider).isLoading,
                        onPressed: _login,
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
