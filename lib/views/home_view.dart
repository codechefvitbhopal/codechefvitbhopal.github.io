import 'package:ccvit/config/assets.dart';
import 'package:ccvit/widgets/about_us.dart';
import 'package:ccvit/widgets/events_gallery.dart';
import 'package:ccvit/widgets/footer.dart';
import 'package:ccvit/widgets/header.dart';
import 'package:ccvit/widgets/theme_inherited_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                    Header(),
                    // SizedBox(
                    //   height: 80,
                    // ),
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
                    Events(cardList: cardList),
                    Footer(),
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
