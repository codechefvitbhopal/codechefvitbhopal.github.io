import 'package:ccvit/config/assets.dart';
import 'package:ccvit/widgets/about_us.dart';
import 'package:ccvit/widgets/events_gallery.dart';
import 'package:ccvit/widgets/footer.dart';
import 'package:ccvit/widgets/header.dart';
import 'package:ccvit/widgets/theme_inherited_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatelessWidget {
  HomeView({
    Key key,
  }) : super(key: key);

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
      ),
      // : Container(
      //     child: Center(
      //       child: Text(
      //         "Opps!!!\nThis website is not available on mobile please switch to desktop.",
      //         textAlign: TextAlign.center,
      //       ),
      //     ),
      //   ),
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
