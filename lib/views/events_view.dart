import 'dart:ui';

import 'package:ccvit/config/assets.dart';
import 'package:ccvit/models/event_model.dart';
import 'package:ccvit/widgets/centeredView/centered_view.dart';
import 'package:ccvit/widgets/footer.dart';
import 'package:ccvit/widgets/header.dart';
import 'package:ccvit/widgets/responsive_widget.dart';
import 'package:ccvit/widgets/theme_inherited_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';

import 'dart:html' as html;

class EventView extends StatefulWidget {
  @override
  _EventViewState createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
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
        .collection('pastEvent')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((element) async {
                Event eventData = Event();
                eventData.image = element['image'];
                eventData.name = element['name'];
                eventData.des = element['desc'];
                // eventData.registrationLink = element['registrationLink'];
                // eventData.github = element['github'];
                // eventData.linkedin = element['linkedin'];
                // eventData.instagram = element['instagram'];
                // eventData.twitter = element['twitter'];
                eventData.medium = element['medium'];
                eventData.dateOfEvent = element['dateOfEvent'];
                // eventData.venue = element['venue'];
                // eventData.tag = element['tag'];

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
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              !ResponsiveWidget.isMediumScreen(context)
                  ? Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Image.asset(
                        Assets.events,
                        scale: 5,
                      ),
                    )
                  : Header(
                      headerImage: ThemeSwitcher.of(context).isDarkModeOn
                          ? Assets.small_header_dark
                          : Assets.small_header,
                      page: "EventHeaderData",
                      active: "event",
                    ),
              !isLoading
                  ? event.isNotEmpty
                      ? CenteredView(
                          horizontal: 10,
                          child: ResponsiveGridRow(
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
                                  desc: event[index].des,
                                  image: event[index].image,
                                  github: event[index].github,
                                  linkedin: event[index].linkedin,
                                  twitter: event[index].twitter,
                                  instagram: event[index].instagram,
                                  medium: event[index].medium,
                                  dateOfEvent: event[index].dateOfEvent,
                                  registrationLink:
                                      event[index].registrationLink,
                                  venue: event[index].venue,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Text("Nothing Found!!")
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
              Footer(
                context: context,
              ),
            ],
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
  final String image;
  final String name;
  final String desc;
  final String linkedin;
  final String github;
  final String medium;
  final String twitter;
  final String instagram;
  final String dateOfEvent;
  final String registrationLink;
  final String venue;
  const EventCard(
      {Key key,
      this.image,
      this.name,
      this.desc,
      this.github,
      this.linkedin,
      this.medium,
      this.instagram,
      this.twitter,
      this.dateOfEvent,
      this.registrationLink,
      this.venue})
      : super(key: key);

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
            Container(
              width: MediaQuery.of(context).size.width,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 200,
                  maxWidth: MediaQuery.of(context).size.width,
                ),
                child: Image.network(
                  image,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;

                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        'Unable to load or image not available',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              color: ThemeSwitcher.of(context).isDarkModeOn
                  ? Color(0xff414141)
                  : Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () =>
                          html.window.open("https://google.com", "name"),
                      icon: Icon(FontAwesomeIcons.linkedin)),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.twitter),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.instagram),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.github),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
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
            Container(
              padding: const EdgeInsets.only(
                bottom: 12.0,
              ),
              width: MediaQuery.of(context).size.width,
              color: ThemeSwitcher.of(context).isDarkModeOn
                  ? Color(0xff414141)
                  : Colors.white,
              alignment: Alignment.center,
              child: Text(
                dateOfEvent,
              ),
            ),
            TextButton(
              onPressed: () => _showMaterialDialog(context, name, desc),
              child: Container(
                padding: const EdgeInsets.only(bottom: 6.0, top: 6.0),
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text(
                  "Read more",
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

_showMaterialDialog(context, name, dec) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Center(
        child: Text(name),
      ),
      content: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 500), child: Text(dec)),
    ),
  );
}
