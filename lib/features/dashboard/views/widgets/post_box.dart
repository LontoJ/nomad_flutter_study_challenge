import 'package:challenge_day16/constants/gaps.dart';
import 'package:challenge_day16/features/dashboard/views/widgets/comment_avartar.dart';
import 'package:challenge_day16/features/dashboard/views/widgets/option_sheet.dart';
import 'package:challenge_day16/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostBox extends StatefulWidget {
  final String username;
  final bool isVerified;
  final String text;
  final String timeAgo;
  final int likes;
  final int comments;
  final int imageCount;

  const PostBox({
    super.key,
    required this.username,
    required this.isVerified,
    required this.text,
    required this.timeAgo,
    required this.likes,
    required this.comments,
    required this.imageCount,
  });

  @override
  State<PostBox> createState() => _PostBoxState();
}

class _PostBoxState extends State<PostBox> {
  void _onOptionTap(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const OptionSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
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
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(getRandomImageUrl()),
                          ),
                          Positioned(
                            right: -5,
                            bottom: -5,
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                    CommentAvatar(
                      commentCount: widget.comments,
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
                                widget.username,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Gaps.h2,
                              widget.isVerified
                                  ? Icon(
                                      Icons.verified,
                                      color: Theme.of(context).primaryColor,
                                      size: 20,
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Opacity(
                                opacity: 0.5,
                                child: Text(
                                  widget.timeAgo,
                                ),
                              ),
                              Gaps.h12,
                              GestureDetector(
                                onTap: () => _onOptionTap(context),
                                child: FaIcon(
                                  FontAwesomeIcons.ellipsis,
                                  size: 16,
                                  color: isDarkMode(context)
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Gaps.v4,
                      Text(
                        widget.text,
                        style: const TextStyle(),
                      ),
                      Gaps.v8,
                      Row(
                        children: [
                          widget.imageCount != 0
                              ? Expanded(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: List.generate(
                                        widget.imageCount,
                                        (index) => Padding(
                                          padding: EdgeInsets.only(
                                              right: (index <
                                                      widget.imageCount - 1)
                                                  ? 8.0
                                                  : 0.0),
                                          // 마지막 이미지가 아닌 경우 오른쪽에 패딩 추가
                                          child: Container(
                                            width: widget.imageCount != 1
                                                ? getRandomWidth(150, 280)
                                                : getRandomWidth(100, 300),
                                            height: 200,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    getRandomImageUrl()),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                      Gaps.v16,
                      Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: 20,
                            color: isDarkMode(context)
                                ? Colors.white
                                : Colors.black,
                          ),
                          Gaps.h10,
                          FaIcon(
                            FontAwesomeIcons.comment,
                            size: 20,
                            color: isDarkMode(context)
                                ? Colors.white
                                : Colors.black,
                          ),
                          Gaps.h10,
                          FaIcon(
                            FontAwesomeIcons.retweet,
                            size: 20,
                            color: isDarkMode(context)
                                ? Colors.white
                                : Colors.black,
                          ),
                          Gaps.h10,
                          FaIcon(
                            FontAwesomeIcons.paperPlane,
                            size: 20,
                            color: isDarkMode(context)
                                ? Colors.white
                                : Colors.black,
                          ),
                        ],
                      ),
                      Gaps.v32,
                      Opacity(
                        opacity: 0.5,
                        child: Text(
                          "${widget.comments} replies • ${widget.likes} likes",
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
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
