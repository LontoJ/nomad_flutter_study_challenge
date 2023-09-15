import 'package:challenge_day16/constants/gaps.dart';
import 'package:challenge_day16/features/dashboard/views/widgets/double_switch.dart';
import 'package:flutter/material.dart';

class OptionSheetScreen extends StatelessWidget {
  final void Function(BuildContext context) onReportTap;

  const OptionSheetScreen({super.key, required this.onReportTap});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [

        DoubleSwitch(
          topText: "Unfollow",
          bottomText: "Mute",
        ),
        Gaps.v20,
        DoubleSwitch(
          topText: "Hide",
          bottomText: "Report",
          onTap: () => onReportTap(context),
        ),
      ],
    );
  }
}
