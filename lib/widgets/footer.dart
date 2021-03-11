import 'package:ccvit/config/assets.dart';
import 'package:ccvit/config/constants.dart';
import 'package:ccvit/widgets/responsive_widget.dart';
import 'package:ccvit/widgets/theme_inherited_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mailto/mailto.dart';
import 'dart:html' as html;

import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  final BuildContext context;
  const Footer({
    Key key,
    this.context,
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
            bottom: ResponsiveWidget.isMobileScreen(context) ? 12 : 30,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                !ResponsiveWidget.isSmallScreen(context)
                    ? Image.asset(
                        Assets.logo_white,
                        scale: 3,
                      )
                    : Container(),
                Text(
                  "VIT BHOPAL CHAPTER",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Segoe UI",
                    fontSize: ResponsiveWidget.isMobileScreen(context) ? 8 : 16,
                    letterSpacing: 4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: ResponsiveWidget.isMobileScreen(context) ? 0.0 : 20,
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
                    socialMediaIcon(
                        FontAwesomeIcons.linkedin, Constants.PROFILE_LINKEDIN),
                    socialMediaIcon(
                        FontAwesomeIcons.twitter, Constants.PROFILE_TWITTER),
                    socialMediaIcon(
                        FontAwesomeIcons.youtube, Constants.YOUTUBE),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                      top:
                          ResponsiveWidget.isMobileScreen(context) ? 0.0 : 8.0),
                  child: Text(
                    "© Copyright 2021 | CodeChef-VIT Bhopal | All rights reserved",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Segoe UI",
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                InkWell(
                  onTap: () async {
                    try {
                      final mailtoLink = Mailto(
                        to: ['codechef@vitbhopal.ac.in'],
                        cc: ['codechef@vitbhopal.ac.in'],
                      );
                      await launch('$mailtoLink');
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                    child: Text(
                      "contact us at codechef@vitbhopal.ac.in",
                      style: TextStyle(color: Colors.white),
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

  Container socialMediaIcon(icon, url) {
    return Container(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          html.window.open(url, "Code Chef VIT Bhopal");
        },
        child: Container(
          margin: EdgeInsets.all(
              ResponsiveWidget.isMobileScreen(context) ? 2.0 : 13.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 12,
                spreadRadius: 2,
                color: ResponsiveWidget.isMobileScreen(context)
                    ? Colors.transparent
                    : Colors.white,
              ),
            ],
          ),
          child: CircleAvatar(
            radius: ResponsiveWidget.isMobileScreen(context) ? 8 : 24,
            backgroundColor: ResponsiveWidget.isMobileScreen(context)
                ? Colors.transparent
                : Colors.white,
            child: Icon(
              icon,
              size: ResponsiveWidget.isMobileScreen(context) ? 12 : 20,
              color: ResponsiveWidget.isMobileScreen(context)
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
