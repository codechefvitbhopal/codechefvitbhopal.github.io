import 'package:auto_size_text/auto_size_text.dart';
import 'package:ccvit/config/assets.dart';
import 'package:ccvit/widgets/responsive_widget.dart';
import 'package:ccvit/widgets/theme_inherited_widget.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isMobileScreen(context)
        ? Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "About Us",
                  style: TextStyle(
                    fontSize: 36,
                    fontFamily: "Segoe UI",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: ResponsiveWidget.isMobileScreen(context) ? 200 : 460,
                  child: AutoSizeText(
                    "CodeChef VIT Bhopal Chapter is a programming club run and maintained by the official chapter leaders and mentored by CodeChef. The chapter drives to make learning competitive programming accessible to students",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize:
                          ResponsiveWidget.isMobileScreen(context) ? 4 : 22,
                      fontFamily: "Segoe UI",
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Our Vision",
                  style: TextStyle(
                    fontSize: 36,
                    fontFamily: "Segoe UI",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: ResponsiveWidget.isMobileScreen(context) ? 200 : 500,
                  child: AutoSizeText(
                    "CodeChef VIT Bhopal Chapter believes in providing everyone with a community of dedicated programmers to build a robust Competitive Programming culture on our campus. The chapter aims to make the college's coding culture the very best culture. The community emphasis to smooth your coding skills, data structures and algorithmic knowledge.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize:
                          ResponsiveWidget.isMobileScreen(context) ? 4 : 22,
                      fontFamily: "Segoe UI",
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container(
            height: 700,
            width: 1080,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ThemeSwitcher.of(context).isDarkModeOn
                    ? AssetImage(Assets.about_us_dark)
                    : AssetImage(Assets.about_us),
                fit: BoxFit.contain,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 60,
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
                        height: 10,
                      ),
                      Container(
                        width: 460,
                        child: AutoSizeText(
                          "CodeChef VIT Bhopal Chapter is a programming club run and maintained by the official chapter leaders and mentored by CodeChef. The chapter drives to make learning competitive programming accessible to students",
                          textAlign: TextAlign.left,
                          maxFontSize: 22,
                          minFontSize: 12,
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: "Segoe UI",
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Our Vision",
                        style: TextStyle(
                          fontSize: 36,
                          fontFamily: "Segoe UI",
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 500,
                        child: AutoSizeText(
                          "CodeChef VIT Bhopal Chapter believes in providing everyone with a community of dedicated programmers to build a robust Competitive Programming culture on our campus. The chapter aims to make the college's coding culture the very best culture. The community emphasis to smooth your coding skills, data structures and algorithmic knowledge.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 21,
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
          );
  }
}
