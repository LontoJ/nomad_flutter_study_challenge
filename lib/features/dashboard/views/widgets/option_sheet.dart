import 'package:challenge_day16/constants/gaps.dart';
import 'package:challenge_day16/constants/sizes.dart';
import 'package:challenge_day16/features/dashboard/views/widgets/option_sheet_screen.dart';
import 'package:challenge_day16/features/dashboard/views/widgets/report_sheet_screen.dart';
import 'package:flutter/material.dart';

class OptionSheet extends StatefulWidget {
  const OptionSheet({super.key});

  @override
  State<OptionSheet> createState() => _OptionSheetState();
}

class _OptionSheetState extends State<OptionSheet> {
  bool isReportSheetOpen = false;

  void _onReportTap(BuildContext context) async {
    setState(() {
      isReportSheetOpen = true;
    });

    print("리포트 화면 열림 => $isReportSheetOpen");
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * (isReportSheetOpen ? 0.7 : 0.45),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 50,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(Sizes.size14),
                  ),
                ),
              ),
              Gaps.v20,
              isReportSheetOpen
                  ? ReportSheetScreen()
                  : OptionSheetScreen(
                      onReportTap: _onReportTap,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
