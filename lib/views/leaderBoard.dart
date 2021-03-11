import 'package:ccvit/config/assets.dart';
import 'package:ccvit/models/event_model.dart';
import 'package:ccvit/models/leaderBoard.dart';
import 'package:ccvit/views/leaderBoardData.dart';
import 'package:ccvit/widgets/centeredView/centered_view.dart';
import 'package:ccvit/widgets/theme_inherited_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../models/sheetModel.dart';
import '../controller/sheetController.dart';
import 'dart:html' as html;

class LeaderBoardView extends StatefulWidget {
  @override
  _LeaderBoardViewState createState() => _LeaderBoardViewState();
}

class _LeaderBoardViewState extends State<LeaderBoardView> {
  List<Event> event = <Event>[];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getEventData();
  }

  Future<void> getEventData() async {
    setState(() {
      isLoading = true;
    });

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    await firestore
        .collection('eventsData')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((element) async {
                Event eventData = Event();
                eventData.image = element['image'];
                eventData.name = element['name'];
                eventData.leaderBoadrdSheetLink = element['rankingData'];
                event.add(eventData);
              })
            });
    print(event.length.toString());
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading)
      return Center(
        child: CircularProgressIndicator(),
      );
    if (isLoading) {
      return Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Something went wrong \nPlease refresh the page',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          ElevatedButton(
            child: Text(
              'Refresh',
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: Colors.white),
            ),
            onPressed: () => html.window.location.reload(),
          )
        ],
      ));
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: CenteredView(
          child: Container(
            // color: Colors.white,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Image.asset(
                    Assets.leaderboard,
                    scale: 5,
                  ),
                ),
                ResponsiveGridRow(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    event.length,
                    (index) => ResponsiveGridCol(
                      xl: 3,
                      lg: 3,
                      md: 4,
                      sm: 6,
                      xs: 12,
                      child: EventCard(
                        name: event[index].name,
                        image: Image.network(event[index].image),
                        viewResult: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => LeaderBoarData(
                                url: event[index].leaderBoadrdSheetLink,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final Image image;
  final String name;
  final Function viewResult;

  const EventCard({
    Key key,
    this.image,
    this.name,
    this.viewResult,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: ThemeSwitcher.of(context).isDarkModeOn
                ? Color(0xff494949)
                : Colors.grey.shade400,
            offset: Offset(0, 2),
          ),
        ],
        color: ThemeSwitcher.of(context).isDarkModeOn
            ? Color(0xff414141)
            : Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        child: Column(
          children: [
            image,
            Container(
              padding: EdgeInsets.only(
                top: 12.0,
                bottom: 6,
              ),
              width: MediaQuery.of(context).size.width,
              color: ThemeSwitcher.of(context).isDarkModeOn
                  ? Color(0xff414141)
                  : Colors.white,
              alignment: Alignment.center,
              child: Text(name),
            ),
            TextButton(
              onPressed: viewResult,
              child: Container(
                padding: const EdgeInsets.only(bottom: 6.0, top: 6.0),
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text(
                  "View Ranking",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
