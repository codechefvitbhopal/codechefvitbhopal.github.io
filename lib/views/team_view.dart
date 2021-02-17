import 'dart:convert';
import 'dart:html';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:ccvit/config/assets.dart';
import 'package:ccvit/models/team_model.dart';
import 'package:ccvit/widgets/centeredView/centered_view.dart';
import 'package:ccvit/widgets/footer.dart';
import 'package:ccvit/widgets/header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;

class TeamView extends StatefulWidget {
  @override
  _TeamViewState createState() => _TeamViewState();
}

class _TeamViewState extends State<TeamView> {
  List<Team> team = <Team>[];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getTeamData(
        "https://raw.githubusercontent.com/woinbo/ccvitbhopal/main/json/teams.json");
  }

  Future<void> getTeamData(String incomingUrl) async {
    setState(() {
      isLoading = true;
    });
    String url = incomingUrl;

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    jsonData['team'].forEach((element) {
      Team teamMember = Team();
      teamMember.imageURL = element['imageURL'];
      teamMember.name = element['name'];
      teamMember.designation = element['designation'];
      teamMember.bio = element['bio'];
      teamMember.github = element['github'];
      teamMember.linkedin = element['linkedin'];
      teamMember.instagram = element['instagram'];
      teamMember.twitter = element['twitter'];
      teamMember.medium = element['medium'];

      team.add(teamMember);
    });
    setState(() {
      isLoading = false;
    });
  }

  // getTeamData() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;

  //   await firestore
  //       .collection('teamData')
  //       .get()
  //       .then((QuerySnapshot querySnapshot) => {
  //             querySnapshot.docs.forEach((doc) async {
  //               Team teamdata = Team();
  //               teamdata.name = doc['name'];
  //               teamdata.imageURL = doc["profileImage"];
  //               team.add(teamdata);
  //             })
  //           });
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Header(
                page: "TeamHeaderData",
                active: "team",
              ),
              Image.asset(
                Assets.team,
                scale: 1.5,
              ),
              !isLoading
                  ? CenteredView(
                      horizontal: 10,
                      child: ResponsiveGridRow(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(
                          team.length,
                          (index) => ResponsiveGridCol(
                            xl: 3,
                            child: TeamMemberCard(
                              name: team[index].name,
                              image: team[index].imageURL,
                              github: team[index].github,
                              linkedin: team[index].linkedin,
                              twitter: team[index].twitter,
                              instagram: team[index].instagram,
                              designation: team[index].designation,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
              Footer(),
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

class TeamMemberCard extends StatelessWidget {
  final String image;
  final String name;
  final String designation;
  final String bio;
  final String linkedin;
  final String github;
  final String instagram;
  final String twitter;
  const TeamMemberCard(
      {Key key,
      this.image,
      this.name,
      this.designation,
      this.bio,
      this.github,
      this.linkedin,
      this.instagram,
      this.twitter})
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
            color: Colors.grey.shade400,
            offset: Offset(0, 2),
          ),
        ],
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        child: Column(
          children: [
            Image.network(
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
                  child: Text('😢'),
                ),
              ),
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () => html.window.open(
                          "https://www.linkedin.com/im/" + linkedin,
                          "linkedin"),
                      icon: Icon(FontAwesomeIcons.linkedin)),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.twitter),
                    onPressed: () => html.window
                        .open("https://www.twitter.com/" + twitter, "name"),
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.instagram),
                    onPressed: () => html.window.open(
                        "https://www.instagram.com/" + instagram, "instagram"),
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.github),
                    onPressed: () => html.window
                        .open("https://www.github.com/" + github, "github"),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 12.0, bottom: bio == null || bio == "" ? 12 : 0),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              alignment: Alignment.center,
              child: Text("$name\n$designation"),
            ),
            bio == null || bio == ""
                ? Container()
                : Container(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: AutoSizeText(bio),
                  )
          ],
        ),
      ),
    );
  }
}
