import 'package:ccvit/config/assets.dart';
import 'package:ccvit/config/constants.dart';
import 'package:ccvit/widgets/theme_inherited_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:html' as html;

class Footer extends StatelessWidget {
  const Footer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.asset(
            ThemeSwitcher.of(context).isDarkModeOn
                ? Assets.footer_dark
                : Assets.footer,
            width: double.infinity,
          ),
          Positioned(
            bottom: 30,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.logo_white,
                      scale: 1.5,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "VIT BHOPAL CHAPER",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Segoe UI",
                        fontSize: 16,
                        letterSpacing: 4,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        socialMediaIcon(FontAwesomeIcons.instagram,
                            Constants.PROFILE_INSTAGRAM),
                        socialMediaIcon(
                            FontAwesomeIcons.medium, Constants.PROFILE_MEDIUM),
                        socialMediaIcon(
                            FontAwesomeIcons.discord, Constants.DISCORD),
                        socialMediaIcon(
                            FontAwesomeIcons.github, Constants.PROFILE_GITHUB),
                        socialMediaIcon(FontAwesomeIcons.linkedin,
                            Constants.PROFILE_LINKEDIN),
                        socialMediaIcon(FontAwesomeIcons.twitter,
                            Constants.PROFILE_TWITTER),
                        socialMediaIcon(
                            FontAwesomeIcons.youtube, Constants.YOUTUBE),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8.0, bottom: 2.0),
                      child: Text(
                        "contact us at codechef@vitbhopal.ac.in",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 2.0, bottom: 8.0),
                      child: Text(
                        "Developed and designed by WOINBO with ❤️",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InkWell socialMediaIcon(icon, url) {
    return InkWell(
      onTap: () {
        html.window.open(url, "Code Chef VIT Bhopal");
      },
      child: Container(
        margin: EdgeInsets.all(13.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 12,
              spreadRadius: 2,
              color: Colors.white,
            ),
          ],
        ),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            icon,
            size: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
