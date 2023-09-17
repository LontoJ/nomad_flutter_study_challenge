import 'package:challenge_day16/constants/gaps.dart';
import 'package:challenge_day16/constants/sizes.dart';
import 'package:challenge_day16/features/authentication/view_models/signup_view_model.dart';
import 'package:challenge_day16/features/authentication/views/confirmation_code_screen.dart';
import 'package:challenge_day16/features/common/widgets/buttons/color_button.dart';
import 'package:challenge_day16/features/common/widgets/logos/twitter_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreateAccountFinalScreen extends ConsumerStatefulWidget {
  static const routeURL = "/create_account_final";
  static const routeName = "create_account_final";

  const CreateAccountFinalScreen({
    super.key,
  });

  @override
  ConsumerState<CreateAccountFinalScreen> createState() =>
      _CreateAccountFinalScreenState();
}

class _CreateAccountFinalScreenState
    extends ConsumerState<CreateAccountFinalScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneOrEmailController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();

  Map<String, String> formData = {};

  void _onScaffoldTap() {
    _changeOpenDatePicker(isOpen: false);
    FocusScope.of(context).unfocus();
  }

  void _changeOpenDatePicker({required bool isOpen}) {
    FocusScope.of(context).unfocus();
  }

  @override
  void initState() {
    super.initState();
    final state = ref.read(signUpForm.notifier).state;

    _nameController.text = state["name"].toString();
    _phoneOrEmailController.text = state["email"].toString();
    _birthdayController.text = state["birth"].toString();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneOrEmailController.dispose();
    _birthdayController.dispose();

    super.dispose();
  }

  void _goToConfirmationCode(BuildContext context) {
    context.push(ConfirmationCodeScreen.routeURL,
        extra: {"email": _phoneOrEmailController.text});
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
                        "Create your account",
                        style: TextStyle(
                          fontSize: Sizes.size28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _nameController,
                              enabled: false,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: Sizes.size20,
                              ),
                              decoration: InputDecoration(
                                  labelText: "Name",
                                  labelStyle: TextStyle(
                                    fontSize: Sizes.size18,
                                    color: Colors.grey.shade700,
                                  ),
                                  floatingLabelStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: Sizes.size18,
                                  ),
                                  // hintText: "Name",
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
                                  suffixIcon: Transform.translate(
                                    offset: const Offset(0, 10),
                                    child: const Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: Sizes.size36,
                                    ),
                                  )),
                              validator: (value) {
                                if (value != null && value.isEmpty) {
                                  return "Please write your name";
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                if (newValue != null) {
                                  formData['name'] = newValue;
                                }
                              },
                            ),
                            Gaps.v10,
                            TextFormField(
                              controller: _phoneOrEmailController,
                              enabled: false,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: Sizes.size18,
                              ),
                              decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle: TextStyle(
                                  fontSize: Sizes.size18,
                                  color: Colors.grey.shade700,
                                ),
                                floatingLabelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: Sizes.size18,
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
                                suffixIcon: Transform.translate(
                                  offset: const Offset(0, 10),
                                  child: const Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                    size: Sizes.size36,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value != null && value.isEmpty) {
                                  return "Please write your name";
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                if (newValue != null) {
                                  formData['name'] = newValue;
                                }
                              },
                            ),
                            Gaps.v10,
                            GestureDetector(
                              onTap: () {
                                _changeOpenDatePicker(isOpen: true);
                              },
                              child: TextFormField(
                                controller: _birthdayController,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: Sizes.size20,
                                ),
                                enabled: false,
                                decoration: InputDecoration(
                                  labelText: "Date of birth",
                                  labelStyle: TextStyle(
                                    fontSize: Sizes.size18,
                                    color: Colors.grey.shade700,
                                  ),
                                  floatingLabelStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: Sizes.size18,
                                  ),
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade600),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  disabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  suffixIcon: Transform.translate(
                                    offset: const Offset(0, 10),
                                    child: const Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: Sizes.size36,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return "Please write your name";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  if (newValue != null) {
                                    formData['name'] = newValue;
                                  }
                                },
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
                                  ". Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy. like keeping your account secure and personalizing our services, including ads.",
                            ),
                            TextSpan(
                              text: " Learn more",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            const TextSpan(
                              text:
                                  ". Others will be able to find you by email or phone number when provided, unless you choose otherwise",
                            ),
                            TextSpan(
                              text: " here",
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
                      Gaps.v20,
                      ColorButton(
                        color: Theme.of(context).primaryColor,
                        text: "Next",
                        onPressed: _goToConfirmationCode,
                        isDisabled: (_nameController.text.isNotEmpty &&
                                _phoneOrEmailController.text.isNotEmpty &&
                                _birthdayController.text.isNotEmpty)
                            ? false
                            : true,
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
