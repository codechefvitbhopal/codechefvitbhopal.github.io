import 'package:auto_size_text/auto_size_text.dart';
import 'package:ccvit/config/assets.dart';
import 'package:ccvit/widgets/centeredView/centered_view.dart';
import 'package:ccvit/widgets/theme_inherited_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:responsive_image/responsive_image.dart';

import 'blog_tab.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key key,
    @required this.cardList,
  }) : super(key: key);

  final List<String> cardList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.of(context).size.width > 300
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
                            Assets.header,
                            // color: Colors.black,
                          ),
                        ),
                        CenteredView(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Image.asset(
                                  Assets.logo_white,
                                  scale: 1.5,
                                ),
                              ),
                              MediaQuery.of(context).size.width > 900
                                  ? Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        _NavBarItem(
                                          child: "HOME",
                                          onPressed: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //       builder: (context) => BlogTab(),
                                            //     ));
                                          },
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        _NavBarItem(
                                          child: "TEAM",
                                          onPressed: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //       builder: (context) => BlogTab(),
                                            //     ));
                                          },
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        _NavBarItem(
                                          child: "EVENTS",
                                          onPressed: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //       builder: (context) => BlogTab(),
                                            //     ));
                                          },
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        _NavBarItem(
                                          child: "ARTICLES",
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      BlogTab(),
                                                ));
                                          },
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        _NavBarItem(
                                          child: "LEADERBOARD",
                                          onPressed: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //       builder: (context) => BlogTab(),
                                            //     ));
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
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      ResponsiveGridCol(
                                                        xs: 12,
                                                        md: 3,
                                                        sm: 3,
                                                        child: _NavBoxItem(
                                                          child: "HOME",
                                                          icon: FontAwesomeIcons
                                                              .home,
                                                          onPressed: () {
                                                            // Navigator.push(
                                                            //     context,
                                                            //     MaterialPageRoute(
                                                            //       builder: (context) => BlogTab(),
                                                            //     ));
                                                          },
                                                        ),
                                                      ),
                                                      ResponsiveGridCol(
                                                        xs: 12,
                                                        md: 3,
                                                        sm: 3,
                                                        child: _NavBoxItem(
                                                          child: "TEAM",
                                                          icon: FontAwesomeIcons
                                                              .home,
                                                          onPressed: () {
                                                            // Navigator.push(
                                                            //     context,
                                                            //     MaterialPageRoute(
                                                            //       builder: (context) => BlogTab(),
                                                            //     ));
                                                          },
                                                        ),
                                                      ),
                                                      ResponsiveGridCol(
                                                        xs: 12,
                                                        md: 3,
                                                        sm: 3,
                                                        child: _NavBoxItem(
                                                          child: "EVENTS",
                                                          icon: FontAwesomeIcons
                                                              .home,
                                                          onPressed: () {
                                                            // Navigator.push(
                                                            //     context,
                                                            //     MaterialPageRoute(
                                                            //       builder: (context) => BlogTab(),
                                                            //     ));
                                                          },
                                                        ),
                                                      ),
                                                      ResponsiveGridCol(
                                                        xs: 12,
                                                        md: 3,
                                                        sm: 3,
                                                        child: _NavBoxItem(
                                                          child: "ARTICLES",
                                                          icon: FontAwesomeIcons
                                                              .home,
                                                          onPressed: () {
                                                            // Navigator.push(
                                                            //     context,
                                                            //     MaterialPageRoute(
                                                            //       builder: (context) => BlogTab(),
                                                            //     ));
                                                          },
                                                        ),
                                                      ),
                                                      ResponsiveGridCol(
                                                        xs: 12,
                                                        md: 3,
                                                        sm: 3,
                                                        child: _NavBoxItem(
                                                          child: "LEADERBOARD",
                                                          icon: FontAwesomeIcons
                                                              .home,
                                                          onPressed: () {
                                                            // Navigator.push(
                                                            //     context,
                                                            //     MaterialPageRoute(
                                                            //       builder: (context) => BlogTab(),
                                                            //     ));
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
                                        size: 32,
                                        color: Colors.white,
                                      )),
                            ],
                          ),
                        ),
                        //    Positioned(
                        //    top: 150,
                        // width: 1200,
                        // child:
                        Container(
                          margin: EdgeInsets.only(top: 120),
                          height: 650,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(Assets.main),
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 90),
                                  child: Image.asset(
                                    Assets.logo_shadow,
                                    scale: 1.5,
                                  ),
                                ),
                                Image.asset(
                                  Assets.cc_vit_chapter,
                                  scale: 1.5,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 110),
                                  width: 260,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    color: Color(0xff4A74F5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "JOIN US TODAY",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Segoe UI",
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        //  ),
                      ],
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    AboutUs(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Image.asset(
                        Assets.events,
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
                    Footre(),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ThemeSwitcher.of(context).switchDarkMode();
        },
        child: ThemeSwitcher.of(context).isDarkModeOn
            ? Icon(FontAwesomeIcons.sun)
            : Icon(
                FontAwesomeIcons.moon,
              ),
      ),
    );
  }
}

class Footre extends StatelessWidget {
  const Footre({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.asset(
            Assets.footer,
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
                        socialMediaIcon(FontAwesomeIcons.instagram),
                        socialMediaIcon(FontAwesomeIcons.medium),
                        socialMediaIcon(FontAwesomeIcons.github),
                        socialMediaIcon(FontAwesomeIcons.linkedin),
                        socialMediaIcon(FontAwesomeIcons.twitter),
                        socialMediaIcon(FontAwesomeIcons.youtube),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      child: Text(
                        "© Copyright 2021 | CodeChef-VIT Bhopal | All rights reserved.",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    // Container(
                    //   margin: const EdgeInsets.all(8.0),
                    //   child: Text(
                    //     "Developed and designed by Woinbo with ❤️",
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontFamily: "Segoe UI",
                    //       fontWeight: FontWeight.normal,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container socialMediaIcon(icon) {
    return Container(
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
    );
  }
}

class AboutUs extends StatelessWidget {
  const AboutUs({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.about_us,
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
              top: 65,
              left: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About Us",
                    style: TextStyle(
                      fontSize: 31,
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
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String child;
  final Function onPressed;
  const _NavBarItem({Key key, this.child, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        child,
        style: GoogleFonts.roboto(
          color: Colors.white,
          fontSize: 18,
        ),
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
