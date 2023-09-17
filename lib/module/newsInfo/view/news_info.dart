import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../home_page/model/news_model.dart';

class NewsInfo extends StatefulWidget {
  const NewsInfo({super.key, required this.newsModel});

  final NewsModel newsModel;

  @override
  State<NewsInfo> createState() => _NewsInfoState();
}

class _NewsInfoState extends State<NewsInfo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    final videoId = YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=Pmg2PtMwhgs&ab_channel=NTVPLUS");
    _controller = YoutubePlayerController(
      initialVideoId: videoId.toString(),
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        controlsVisibleAtStart: true,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 120,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              color: Colors.green.withOpacity(0.9),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Post",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressColors: const ProgressBarColors(
                playedColor: Colors.green,
                handleColor: Colors.green,
              ),
              // bottomActions: [
              //   Container(
              //     child: Row(
              //       children: [
              //         Text(
              //           durationFormatter(_controller.metadata.duration.inMicroseconds).toString(),
              //         ),
              //       ],
              //     ),
              //   ),
              // ],
              actionsPadding: EdgeInsets.zero,
              bottomActions: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  color: Colors.black.withOpacity(0.5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 14.0),
                          CurrentPosition(),
                          const SizedBox(width: 4.0),
                          // const Text(
                          //   "/",
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //   ),
                          // ),
                          RemainingDuration(),
                          // Text(
                          //   "${durationFormatter(
                          //     (_controller.metadata.duration.inMilliseconds),
                          //   )}",
                          //   style: const TextStyle(
                          //     color: Colors.white,
                          //   ),
                          // ),
                          const SizedBox(width: 4.0),
                          const Spacer(),
                          // const PlaybackSpeedButton(),
                          FullScreenButton(),
                        ],
                      ),
                      ProgressBar(
                        isExpanded: true,
                        colors: const ProgressBarColors(playedColor: Colors.green, handleColor: Colors.green, backgroundColor: Colors.grey),
                        // colors: widget.progressColors,
                      ),
                    ],
                  ),
                ),
              ],
              // bottomActions: [
              //   Container(
              //     width: double.infinity,
              //     height: 50,
              //     color: Colors.grey.withOpacity(0.2),
              //     child: CurrentPosition(),
              //   )
              // ],
              onReady: () {
                // _controller.addListener(listner){
                //   print(listner);
                // };
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Wrap(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center, runSpacing: 10,
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.3,
                    child: Container(
                      width: 100,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/youtube.svg",
                            color: Colors.white,
                          ),
                          const Text(
                            "YouTube",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const FractionallySizedBox(
                    widthFactor: 0.5,
                  ),
                  const FractionallySizedBox(
                    widthFactor: 0.2,
                    child: Text(
                      "1 hour ago",
                      style: TextStyle(color: Colors.grey, fontSize: 9),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                widget.newsModel.title!.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                widget.newsModel.body!,
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                children: [
                  Text(
                    "Mobile App: ",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "http://bit.ly/nepaltelevision",
                    style: TextStyle(fontSize: 13, decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
