import 'package:challenge_day16/constants/gaps.dart';
import 'package:challenge_day16/constants/sizes.dart';
import 'package:challenge_day16/features/authentication/view_models/signup_view_model.dart';
import 'package:challenge_day16/features/authentication/views/customize_experience_screen.dart';
import 'package:challenge_day16/features/common/widgets/buttons/color_button.dart';
import 'package:challenge_day16/features/common/widgets/buttons/custom_text_button.dart';
import 'package:challenge_day16/features/common/widgets/logos/twitter_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class CreateAccountScreen extends ConsumerStatefulWidget {
  static const routeURL = "/create_account";
  static const routeName = "create_account";

  const CreateAccountScreen({
    super.key,
  });

  @override
  ConsumerState<CreateAccountScreen> createState() =>
      _CreateAccountScreenState();
}

class _CreateAccountScreenState extends ConsumerState<CreateAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneOrEmailController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final FocusNode _phoneOrEmailFocusNode = FocusNode();
  bool _isNameEmpty = true;
  bool _isPhoneOrEmailEmpty = true;
  bool _isBirthdayEmpty = true;
  bool _isPhoneOrEmailFocus = false;

  Map<String, String> formData = {};
  DateTime initialDate = DateTime.now();
  bool isOpenDatePicker = false;

  void _goToInitScreen(BuildContext context) {
    context.pop();
  }

  void _goToCustomizeExperience(BuildContext context) {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        ref.read(signUpForm.notifier).state = {
          ...formData,
          "email": formData['email']
        };
        context.push(
          CustomizeExperienceScreen.routeURL,
        );
      }
    }
  }

  void _onScaffoldTap() {
    _changeOpenDatePicker(isOpen: false);
    FocusScope.of(context).unfocus();
  }

  void _setTextFieldDate(DateTime date) {
    DateTime parsedDate = DateTime.parse(date.toString());
    String formattedDate = DateFormat('MMMM d, y').format(parsedDate);
    _birthdayController.value = TextEditingValue(text: formattedDate);
  }

  void _changeOpenDatePicker({required bool isOpen}) {
    FocusScope.of(context).unfocus();
    setState(() {
      isOpenDatePicker = isOpen;
    });
  }

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      print(_nameController.text.isEmpty);
      setState(() {
        _isNameEmpty = _nameController.text.isEmpty;
      });
    });
    _phoneOrEmailController.addListener(() {
      setState(() {
        _isPhoneOrEmailEmpty = _phoneOrEmailController.text.isEmpty;
      });
    });
    _birthdayController.addListener(() {
      setState(() {
        _isBirthdayEmpty = _birthdayController.text.isEmpty;
      });
    });
    _phoneOrEmailFocusNode.addListener(() {
      if (_phoneOrEmailFocusNode.hasFocus) {
        _isPhoneOrEmailFocus = true;
      } else {
        _isPhoneOrEmailFocus = false;
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneOrEmailController.dispose();
    _birthdayController.dispose();
    _phoneOrEmailFocusNode.dispose();

    super.dispose();
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: CustomTextButton(
                              text: "Cancel",
                              onPressed: _goToInitScreen,
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
                              enabled: !isOpenDatePicker,
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
                                suffixIcon: !_isNameEmpty
                                    ? Transform.translate(
                                        offset: const Offset(0, 10),
                                        child: const Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                          size: Sizes.size36,
                                        ),
                                      )
                                    : null,
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
                            TextFormField(
                              controller: _phoneOrEmailController,
                              focusNode: _phoneOrEmailFocusNode,
                              enabled: !isOpenDatePicker,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: Sizes.size18,
                              ),
                              decoration: InputDecoration(
                                labelText: _isPhoneOrEmailFocus ||
                                        !_isPhoneOrEmailEmpty
                                    ? "Email"
                                    : "Phone number or email address",
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
                                suffixIcon: !_isPhoneOrEmailEmpty
                                    ? Transform.translate(
                                        offset: const Offset(0, 10),
                                        child: const Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                          size: Sizes.size36,
                                        ),
                                      )
                                    : null,
                              ),
                              validator: (value) {
                                if (value != null && value.isEmpty) {
                                  return "Please write your name";
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                if (newValue != null) {
                                  formData['email'] = newValue;
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
                                  suffixIcon: !_isBirthdayEmpty
                                      ? Transform.translate(
                                          offset: const Offset(0, 10),
                                          child: const Icon(
                                            Icons.check_circle,
                                            color: Colors.green,
                                            size: Sizes.size36,
                                          ),
                                        )
                                      : null,
                                ),
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return "Please write your name";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  if (newValue != null) {
                                    formData['birth'] = newValue;
                                  }
                                },
                              ),
                            ),
                            Gaps.v20,
                            Text(
                              "This will not be shown publicly. Confirm your\nown age, even if this account is for a\nbusiness, a pet, or something else.",
                              style: TextStyle(
                                color: Colors.grey.shade700,
                              ),
                            ),
                            Gaps.v96,
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
                        child: FractionallySizedBox(
                          widthFactor: 0.4,
                          child: ColorButton(
                            text: "Next",
                            onPressed: _goToCustomizeExperience,
                            isDisabled: (_nameController.text.isNotEmpty &&
                                    _phoneOrEmailController.text.isNotEmpty &&
                                    _birthdayController.text.isNotEmpty)
                                ? false
                                : true,
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                        height: isOpenDatePicker ? 200 : 0,
                        child: Visibility(
                          visible: isOpenDatePicker,
                          child: CupertinoDatePicker(
                            maximumDate: initialDate,
                            initialDateTime: initialDate,
                            mode: CupertinoDatePickerMode.date,
                            onDateTimeChanged: _setTextFieldDate,
                          ),
                        ),
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
