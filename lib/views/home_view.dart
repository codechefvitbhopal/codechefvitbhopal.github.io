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
    'https://lh6.googleusercontent.com/ebpm7TczoqIXrBsC-0nsFhJqDonYy3ta4qsz9z-y7XDJMMmFGznuG5nYAlYwveoiWuEIuIH9lV83gA=w1760-h947-rw',
    'https://lh4.googleusercontent.com/-wuefTS0NRR4mX7etaB6RHC-3fM4bLuWWHAXze736ncMBPE8hB2s4ISQWCxPfZzXfWErndP7N-9MyA=w1920-h990-rw',
    'https://lh6.googleusercontent.com/22x5ILgZJ9-12xi9mQzuk-0YY43fc6t4F_zkk4z-8RfjVtQZBtMGtxS8VTJrcwjfX7z17987-rfXNA=w1920-h990-rw',
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
