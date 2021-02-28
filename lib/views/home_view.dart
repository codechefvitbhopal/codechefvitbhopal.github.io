import 'package:ccvit/config/assets.dart';
import 'package:ccvit/widgets/about_us.dart';
import 'package:ccvit/widgets/events_gallery.dart';
import 'package:ccvit/widgets/footer.dart';
import 'package:ccvit/widgets/header.dart';
import 'package:ccvit/widgets/responsive_widget.dart';
import 'package:ccvit/widgets/theme_inherited_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatelessWidget {
  HomeView({
    Key key,
  }) : super(key: key);

  final List<String> cardList = [
    'assets/events/codeyessey.png',
    'assets/events/leaders_league.png',
    'assets/events/resource_buffer.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Header(
                headerImage: ThemeSwitcher.of(context).isDarkModeOn
                    ? Assets.header_dark
                    : Assets.header,
                page: "HomeHeaderData",
                active: "home",
              ),
              // SizedBox(
              //   height: 80,
              // ),
              AboutUs(),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Image.asset(
                  ThemeSwitcher.of(context).isDarkModeOn
                      ? Assets.events_dark
                      : Assets.events,
                  scale: 2,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Events(cardList: cardList),
              Footer(context: context),
            ],
          ),
        ),
      ),
      // : Container(
      //     child: Center(
      //       child: Text(
      //         "Opps!!!\nThis website is not available on mobile please switch to desktop.",
      //         textAlign: TextAlign.center,
      //       ),
      //     ),
      //   ),
      floatingActionButton: Container(
        height: ResponsiveWidget.isMobileScreen(context) ? 38 : 52,
        child: FloatingActionButton(
          onPressed: () {
            ThemeSwitcher.of(context).switchDarkMode();
          },
          child: ThemeSwitcher.of(context).isDarkModeOn
              ? Icon(FontAwesomeIcons.sun)
              : Icon(
                  FontAwesomeIcons.moon,
                  size: ResponsiveWidget.isMobileScreen(context) ? 16 : 24,
                ),
        ),
      ),
    );
  }
}
