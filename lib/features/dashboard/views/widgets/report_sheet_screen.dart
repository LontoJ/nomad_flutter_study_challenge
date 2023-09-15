import 'package:challenge_day16/constants/gaps.dart';
import 'package:challenge_day16/constants/sizes.dart';
import 'package:flutter/material.dart';

class ReportSheetScreen extends StatefulWidget {
  const ReportSheetScreen({super.key});

  @override
  State<ReportSheetScreen> createState() => _ReportSheetScreenState();
}

class _ReportSheetScreenState extends State<ReportSheetScreen> {
  final ScrollController _scrollController = ScrollController();

  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Scrollbar(
        controller: _scrollController,
        child: ListView.separated(
          controller: _scrollController,
          separatorBuilder: (context, index) => Divider(
            thickness: 0.5,
            height: 30,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            // 첫 번째 아이템으로 "Report" 텍스트 반환
            if (index == 0) {
              return Column(
                children: [
                  Text(
                    "Report",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Sizes.size20,
                    ),
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size16,
                      horizontal: Sizes.size16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Why are you reporting this thread?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.size18,
                          ),
                        ),
                        Text(
                          "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
                          style: TextStyle(
                            fontSize: Sizes.size14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }

            // 실제 데이터 인덱스 조정
            int dataIndex = index - 1;
            return Padding(
              padding: const EdgeInsets.symmetric(
                // vertical: Sizes.size16,
                horizontal: Sizes.size16,
              ),
              child: Column(
                children: [
                  if (dataIndex != 0) Gaps.v20,
                  ListTile(
                    title: Text('Report Reason ${dataIndex + 1}'), // 예시 텍스트
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: Sizes.size16,
                    ), // 화살표 아이콘
                    onTap: () {
                      // 타일을 탭할 때의 동작을 여기에 추가합니다.
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
