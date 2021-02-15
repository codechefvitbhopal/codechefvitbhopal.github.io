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
import 'package:responsive_grid/responsive_grid.dart';
import 'package:http/http.dart' as http;

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

      teamMember.designation = element['designation'];
      teamMember.name = element['name'];
      teamMember.imageURL = element['imageURL'];

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
                      child: ResponsiveGridRow(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(
                          team.length,
                          (index) => ResponsiveGridCol(
                            xs: 12,
                            sm: 6,
                            md: 4,
                            lg: 4,
                            xl: 3,
                            child: _TeamIteamBox(
                              name: team[index].name,
                              image: team[index].imageURL,
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

class _TeamIteamBox extends StatelessWidget {
  final String image;
  final String name;
  final String designation;
  final String bio;
  final String linkedin;
  final String github;
  final String medium;
  final String twitter;
  const _TeamIteamBox(
      {Key key,
      this.image,
      this.name,
      this.designation,
      this.bio,
      this.github,
      this.linkedin,
      this.medium,
      this.twitter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // Stack(
        //   children: [
        Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 8,
            color: Colors.grey.shade300,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0)),
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
                  child: Text('😢'),
                ),
              ),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 8),
            child: AutoSizeText(
              "$name, \n$designation",
              minFontSize: 8,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              ),
            ),
            alignment: Alignment.center,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: bio == null || bio == "" ? Text("") : AutoSizeText(bio),
          ),
        ],
      ),
    );
    // Positioned(
    //     left: 225,
    //     bottom: 37,
    //     child: Container(
    //       decoration: BoxDecoration(
    //         boxShadow: [
    //           BoxShadow(
    //             offset: Offset(0, 0),
    //             blurRadius: 8,
    //             color: Colors.grey.shade400,
    //           ),
    //         ],
    //         color: Colors.white,
    //         borderRadius: BorderRadius.all(
    //           Radius.circular(50.0),
    //         ),
    //       ),
    //       child: CircleAvatar(
    //         backgroundColor: Colors.white,
    //         child: Icon(FontAwesomeIcons.linkedin),
    //       ),
    //     ));
    //   ],
    // );
  }
}
