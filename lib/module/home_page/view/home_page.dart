import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/module/home_page/cubit/news_cubit.dart';
import 'package:news/module/home_page/model/news_model.dart';
import 'package:news/module/newsInfo/view/news_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  void initState() {
    context.read<NewsCubit>().getAllNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 120,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            color: Colors.green.withOpacity(0.9),
            child: const Row(
              children: [
                Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Video",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
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
          const SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: const Offset(0, 20),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                padding: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  //   boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.5),
                  //     blurRadius: 8, // Spread of the shadow
                  //     offset: const Offset(0, 4),
                  //   )
                  //
                  // ]
                ),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 20,
                    );
                  },
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Trending",
                            style: TextStyle(color: Colors.black),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          selectedIndex == index
                              ? Container(
                                  width: 55,
                                  height: 4,
                                  color: Colors.green,
                                )
                              : const SizedBox(
                                  height: 4,
                                )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          BlocBuilder<NewsCubit, List<NewsModel>>(
            builder: (context, newsList) {
              return Expanded(
                  child: GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      itemCount: newsList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 0.56,
                      ),
                      itemBuilder: (context, index) {
                        final newsModel = newsList[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => NewsInfo(newsModel: newsModel)));
                          },
                          child: Container(
                            // height: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 1),
                            ),
                            padding: const EdgeInsets.all(10),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 67,
                                  child: Text(
                                    newsModel.title!.toUpperCase(),
                                    maxLines: 3,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Wrap(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: WrapCrossAlignment.center, runSpacing: 10,
                                  children: [
                                    FractionallySizedBox(
                                      widthFactor: 0.74,
                                      child: Container(
                                        width: 100,
                                        height: 20,
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
                                      widthFactor: 0.05,
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
                                const SizedBox(
                                  height: 10,
                                ),
                                Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/TIGER.jpeg",
                                      height: 165,
                                      fit: BoxFit.fill,
                                    ),
                                    const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 35,
                                      child: Center(
                                        child: Icon(
                                          Icons.play_arrow,
                                          size: 40,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }));
            },
          )
        ],
      ),
    );
  }
}
