import 'package:auto_size_text/auto_size_text.dart';
import 'package:ccvit/config/assets.dart';
import 'package:ccvit/config/constants.dart';
import 'package:ccvit/views/blog_view.dart';
import 'package:ccvit/views/events_view.dart';
import 'package:ccvit/views/home_view.dart';
import 'package:ccvit/views/leaderBoard.dart';
import 'package:ccvit/views/team_view.dart';
import 'package:ccvit/widgets/responsive_widget.dart';
import 'package:ccvit/widgets/theme_inherited_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'centeredView/centered_view.dart';

import 'dart:html' as html;

class Header extends StatefulWidget {
  final String page;
  final String active;
  final String headerImage;
  const Header({Key key, this.page, this.active, @required this.headerImage})
      : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          child: Image.asset(
            widget.headerImage,

            // color: Colors.black,
          ),
        ),
        CenteredView(
          vertical: ResponsiveWidget.isMobileScreen(context) ? 10 : 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Image.asset(
                  Assets.logo_white,
                  scale: ResponsiveWidget.isMobileScreen(context) ? 4 : 1.5,
                ),
              ),
              MediaQuery.of(context).size.width > 900
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _NavBarItem(
                          // child: "HOME",
                          icon: FontAwesomeIcons.home,
                          active: widget.active == "home",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeView(),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        _NavBarItem(
                          // child: "TEAM",
                          icon: FontAwesomeIcons.users,
                          active: widget.active == "team",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TeamView(),
                                ));
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        _NavBarItem(
                          // child: "EVENTS",
                          icon: FontAwesomeIcons.calendarCheck,

                          active: widget.active == "event",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EventView(),
                                ));
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        _NavBarItem(
                          // child: "ARTICLES",
                          icon: FontAwesomeIcons.newspaper,

                          active: widget.active == "newspaper",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BlogTab(),
                                ));
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        _NavBarItem(
                          // child: "LEADERBOARD",
                          icon: FontAwesomeIcons.trophy,

                          active: widget.active == "trophy",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LeaderBoardView(),
                                ));
                          },
                        ),
                      ],
                    )
                  : IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (_) => Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(
                                  20,
                                ),
                              ),
                            ),
                            height: 500,
                            child: Center(
                              child: SingleChildScrollView(
                                child: ResponsiveGridRow(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      ResponsiveGridCol(
                                        xs: 12,
                                        md: 3,
                                        sm: 3,
                                        child: _NavBoxItem(
                                          child: "HOME",
                                          icon: FontAwesomeIcons.home,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeView(),
                                                ));
                                          },
                                        ),
                                      ),
                                      ResponsiveGridCol(
                                        xs: 12,
                                        md: 3,
                                        sm: 3,
                                        child: _NavBoxItem(
                                          child: "TEAM",
                                          icon: FontAwesomeIcons.users,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      TeamView(),
                                                ));
                                          },
                                        ),
                                      ),
                                      ResponsiveGridCol(
                                        xs: 12,
                                        md: 3,
                                        sm: 3,
                                        child: _NavBoxItem(
                                          child: "EVENTS",
                                          icon: FontAwesomeIcons.calendarCheck,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      EventView(),
                                                ));
                                          },
                                        ),
                                      ),
                                      ResponsiveGridCol(
                                        xs: 12,
                                        md: 3,
                                        sm: 3,
                                        child: _NavBoxItem(
                                          child: "ARTICLES",
                                          icon: FontAwesomeIcons.newspaper,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      BlogTab(),
                                                ));
                                          },
                                        ),
                                      ),
                                      ResponsiveGridCol(
                                        xs: 12,
                                        md: 3,
                                        sm: 3,
                                        child: _NavBoxItem(
                                          child: "LEADERBOARD",
                                          icon: FontAwesomeIcons.trophy,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      LeaderBoardView(),
                                                ));
                                          },
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        FontAwesomeIcons.bars,
                        color: Colors.white,
                      ),
                    ),
            ],
          ),
        ),
        if (widget.page == "HomeHeaderData")
          HomeHeaderData()
        else if (widget.page == "TeamHeaderData")
          TeamHeaderData()
      ],
    );
  }
}

class TeamHeaderData extends StatefulWidget {
  @override
  _TeamHeaderDataState createState() => _TeamHeaderDataState();
}

class _TeamHeaderDataState extends State<TeamHeaderData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 120),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      width: 700,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(100.0),
        ),
        color: Colors.white12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AutoSizeText(
            "TEAM",
            style: TextStyle(
              fontFamily: "Segoe UI",
              fontSize: 36,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 8,
            ),
          ),
          AutoSizeText(
            "Talent wins games, but teamwork and intelligence win championships.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Segoe UI",
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
              right: 20,
              top: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AutoSizeText(
                  "--Michael Jordan",
                  style: TextStyle(
                    fontFamily: "Segoe UI",
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
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

class HomeHeaderData extends StatefulWidget {
  const HomeHeaderData({
    Key key,
  }) : super(key: key);

  @override
  _HomeHeaderDataState createState() => _HomeHeaderDataState();
}

class _HomeHeaderDataState extends State<HomeHeaderData> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: ResponsiveWidget.isMobileScreen(context) ? 60 : 120),
      height: ResponsiveWidget.isMobileScreen(context) ? 240 : 650,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            ThemeSwitcher.of(context).isDarkModeOn
                ? Assets.main_dark
                : Assets.main,
          ),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: ResponsiveWidget.isMobileScreen(context) ? 0 : 70),
              child: Image.asset(
                ThemeSwitcher.of(context).isDarkModeOn
                    ? Assets.logo_shadow_dark
                    : Assets.logo_shadow,
                scale: ResponsiveWidget.isMobileScreen(context)
                    ? 1 / MediaQuery.of(context).size.width * 1000
                    : 1.5,
              ),
            ),
            Image.asset(
              ThemeSwitcher.of(context).isDarkModeOn
                  ? Assets.cc_vit_chapter_dark
                  : Assets.cc_vit_chapter,
              scale: ResponsiveWidget.isMobileScreen(context)
                  ? 1 / MediaQuery.of(context).size.width * 1400
                  : 1.5,
            ),
            InkWell(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              onTap: () {
                html.window.open(Constants.DISCORD, "discord");
              },
              onHover: (h) {
                setState(() {
                  _isHover = h;
                });
              },
              onFocusChange: (h) {
                setState(() {
                  _isHover = h;
                });
              },
              child: Container(
                margin: EdgeInsets.only(
                    top: ResponsiveWidget.isMobileScreen(context) ? 5 : 120),
                width: ResponsiveWidget.isMobileScreen(context) ? 80 : 260,
                height: ResponsiveWidget.isMobileScreen(context) ? 20 : 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  color: ThemeSwitcher.of(context).isDarkModeOn
                      ? Color(0xff494949)
                      : Color(0xff4A74F5),
                ),
                child: Center(
                  child: !_isHover
                      ? Text(
                          "JOIN US TODAY",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Segoe UI",
                            fontSize: ResponsiveWidget.isMobileScreen(context)
                                ? 8
                                : 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Icon(
                          FontAwesomeIcons.discord,
                          color: Colors.white,
                          size: ResponsiveWidget.isMobileScreen(context)
                              ? 12
                              : 32,
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String child;
  final Function onPressed;
  final IconData icon;
  final bool active;
  const _NavBarItem(
      {Key key, this.child, @required this.onPressed, this.icon, this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: child != null
          ? Row(
              children: [
                Icon(icon),
                Text(
                  child,
                  style: GoogleFonts.roboto(
                    color: active ? Colors.white : Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            )
          : Icon(
              icon,
              color: active ? Colors.white : Colors.white70,
            ),
    );
  }
}

class _NavBoxItem extends StatelessWidget {
  final String child;
  final icon;
  final Function onPressed;
  const _NavBoxItem({Key key, this.child, this.onPressed, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(8.0),
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: Colors.grey.shade300,
            )
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            SizedBox(
              height: 10,
            ),
            Text(
              child,
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
