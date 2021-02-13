import 'package:ccvit/widgets/centeredView/centered_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: CodeChefVitBhopalApp()));

class CodeChefVitBhopalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                        // top: 80,
                        // left: 340,
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
              Container(
                height: 500,
                child: Text("asd dvasdas vahvkv "),
              )
            ],
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
