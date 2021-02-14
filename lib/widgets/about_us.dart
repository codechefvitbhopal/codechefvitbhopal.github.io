import 'package:auto_size_text/auto_size_text.dart';
import 'package:ccvit/config/assets.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: 1080,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.about_us,
          ),
          fit: BoxFit.contain,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 65,
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
    );
  }
}
