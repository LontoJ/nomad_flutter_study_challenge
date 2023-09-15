import 'package:challenge_day16/constants/gaps.dart';
import 'package:challenge_day16/constants/sizes.dart';
import 'package:challenge_day16/features/authentication/views/password_screen.dart';
import 'package:challenge_day16/features/common/widgets/buttons/color_button.dart';
import 'package:challenge_day16/features/common/widgets/logos/twitter_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  static const routeURL = "/confirmation_code";
  static const routeName = "confirmation_code";
  final Map<String, String>? object;

  const ConfirmationCodeScreen({super.key, this.object});

  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  List<String?> code = List.filled(6, "");

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _goToPasswordScreen(BuildContext context) {
    context.push(
      PasswordScreen.routeURL,
    );
  }

  void _handleCode(String value) {
    setState(() {
      for (int i = 0; i < 6; i++) {
        if (i < value.length) {
          code[i] = value[i];
        } else {
          code[i] = "";
        }
      }
    });
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
                          "We sent you a code",
                          style: TextStyle(
                            fontSize: Sizes.size28,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Gaps.v24,
                        Text(
                          "Enter it below to verify\n${widget.object?["email"] ?? ""}.",
                        ),
                        Gaps.v64,
                        Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(6, (index) {
                                  return Container(
                                    width: 40,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: (code[index] != null &&
                                                  code[index]!.isNotEmpty)
                                              ? Colors.black
                                              : Colors.grey,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          code[index] ?? "",
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                              TextField(
                                keyboardType: TextInputType.number,
                                showCursor: false,
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r'\s')),
                                ],
                                maxLength: 6,
                                cursorColor: Colors.transparent,
                                style: const TextStyle(
                                  color: Colors.transparent,
                                  backgroundColor: Colors.transparent,
                                ),
                                decoration: const InputDecoration(
                                  fillColor: Colors.transparent,
                                  filled: true,
                                  counterText: "",
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                ),
                                onChanged: _handleCode,
                              ),
                            ],
                          ),
                        ),
                        Gaps.v16,
                        code.contains("")
                            ? const SizedBox()
                            : const Center(
                                child: Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 40,
                                ),
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
                      CupertinoButton(
                        child: const Text(
                          "Didn't receive email?",
                          style: TextStyle(color: Colors.blue),
                        ),
                        onPressed: () {},
                      ),
                      ColorButton(
                        text: "Next",
                        isDisabled: code.contains(""),
                        onPressed: _goToPasswordScreen,
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
