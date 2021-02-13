import 'dart:html';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ccvit/widgets/centeredView/centered_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() => runApp(MaterialApp(home: CodeChefVitBhopalApp()));

class CodeChefVitBhopalApp extends StatefulWidget {
  @override
  _CodeChefVitBhopalAppState createState() => _CodeChefVitBhopalAppState();
}

class _CodeChefVitBhopalAppState extends State<CodeChefVitBhopalApp> {
  final List<String> cardList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.of(context).size.width > 800
          ? SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            "assets/images/header.png",
                          ),
                        ),
                        CenteredView(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/logo/whiteLogo.png",
                                scale: 1.3,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _NavBarItem(child: "HOME"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  _NavBarItem(child: "TEAM"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  _NavBarItem(child: "EVENTS"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  _NavBarItem(child: "ARTICLES"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  _NavBarItem(child: "LEADERBOARD"),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 120,
                          width: 1200,
                          child: Container(
                            height: 600,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/main.png"),
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/logo/ccwhite_shadow.png",
                                    scale: 1.5,
                                  ),
                                  Image.asset(
                                    "assets/images/cc_vit_chapter.png",
                                    scale: 1.5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 240,
                      width: 200,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/about-us.png",
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                      child: Container(
                        height: 700,
                        width: 1080,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 80,
                              left: 80,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "About Us",
                                    style: TextStyle(
                                      fontSize: 36,
                                      fontFamily: "Segoe UI",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 460,
                                    child: AutoSizeText(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontFamily: "Segoe UI",
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text(
                                    "About Our Goals",
                                    style: TextStyle(
                                      fontSize: 36,
                                      fontFamily: "Segoe UI",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 460,
                                    child: AutoSizeText(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontFamily: "Segoe UI",
                                        fontWeight: FontWeight.w100,
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
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Image.asset(
                        "assets/images/events.png",
                        scale: 2,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 450,
                      width: 600,
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 16,
                                    color: Colors.grey.shade300,
                                    offset: Offset(0, 6),
                                  )
                                ]),
                            child: Image.network(
                              cardList[index],
                            ),
                          );
                        },
                        itemCount: 3,
                        viewportFraction: 0.8,
                        scale: 0.8,
                      ),
                    ),
                    Text("Hello")
                  ],
                ),
              ),
            )
          : Container(
              child: Center(
                child: Text(
                  "Opps!!!\nThis website is not available on mobile please switch to desktop.",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String child;
  const _NavBarItem({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(child);
      },
      child: Text(
        child,
        style: TextStyle(
          fontFamily: "Roboto",
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
