import 'dart:io';

import 'package:challenge_day16/constants/gaps.dart';
import 'package:challenge_day16/features/camera/views/camera_screen.dart';
import 'package:challenge_day16/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WriteBox extends StatefulWidget {
  final String username;
  final Function(String) onTextChanged;

  const WriteBox({
    super.key,
    required this.username,
    required this.onTextChanged,
  });

  @override
  State<WriteBox> createState() => _WriteBoxState();
}

class _WriteBoxState extends State<WriteBox> {
  final TextEditingController _controller = TextEditingController();
  String picturePath = "";

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      widget.onTextChanged(_controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goToCameraScreen() async {
    final cameraResult = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CameraScreen(),
        fullscreenDialog: true,
      ),
    );

    print("카메라 결과 => ${cameraResult}");
    if (cameraResult != null) {
      setState(() {
        picturePath = cameraResult;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          "https://source.unsplash.com/random/300x300/?pet"),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18.0,
                          vertical: 10,
                        ),
                        child: Container(
                          width: 2,
                          color: isDarkMode(context)
                              ? Colors.grey.shade600
                              : Colors.black12,
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          "https://source.unsplash.com/random/300x300/?pet"),
                    ),
                  ],
                ),
                Gaps.h16,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "${widget.username}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Gaps.v4,
                      TextField(
                        controller: _controller,
                        minLines: null,
                        maxLines: null, // 여러 줄 입력 허용
                        decoration: InputDecoration(
                          hintText: "Start a thread...",
                          hintStyle: TextStyle(
                            color: isDarkMode(context)
                                ? Colors.grey
                                : Colors.grey.shade600,
                          ),
                          // 힌트 텍스트 설정
                          border: InputBorder.none,
                          // 밑줄 제거
                          focusedBorder: InputBorder.none,
                          // 포커스 시 밑줄 제거
                          enabledBorder: InputBorder.none,
                          // 기본 밑줄 제거
                          errorBorder: InputBorder.none,
                          // 에러 시 밑줄 제거
                          disabledBorder: InputBorder.none, // 비활성화 시 밑줄 제거
                        ),
                      ),
                      picturePath == ""
                          ? IconButton(
                              onPressed: _goToCameraScreen,
                              icon: const FaIcon(
                                FontAwesomeIcons.paperclip,
                                color: Colors.grey,
                              ),
                            )
                          : Stack(
                              children: [
                                Container(
                                  height: 230,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: FileImage(File(picturePath)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        picturePath = "";
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black38,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      Gaps.v48,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
