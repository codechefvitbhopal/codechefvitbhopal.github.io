import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ccvit/config/assets.dart';
import 'package:ccvit/models/team_model.dart';
import 'package:ccvit/widgets/centeredView/centered_view.dart';
import 'package:ccvit/widgets/divider.dart';
import 'package:ccvit/widgets/footer.dart';
import 'package:ccvit/widgets/header.dart';
import 'package:ccvit/widgets/responsive_widget.dart';
import 'package:ccvit/widgets/theme_inherited_widget.dart';
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
        "https://gist.githubusercontent.com/woinbo/78c767a60a12b23b827363d087b5fd79/raw/9b27caddb84bf1a9798f2e13c916f5449ba903b5/teams.json");
    // getTeamData("https://raw.githubusercontent.com/codechefvitbhopal/codechefvitbhopal.github.io/master/json/teams.json");
  }

  Future<void> getTeamData(String incomingUrl) async {
    setState(() {
      isLoading = true;
    });
    String url = incomingUrl;

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    print(response);
    print(jsonData);
    jsonData['team'].forEach((element) {
      if (element['tag'] != null) {
        Team teamMember = Team();
        teamMember.tag = element['tag'];
        team.add(teamMember);
      } else {
        Team teamMember = Team();
        teamMember.imageURL = element['imageURL'];
        teamMember.name = element['name'];
        teamMember.designation = element['designation'];
        teamMember.bio = element['bio'];
        teamMember.github = element['social']['github'];
        teamMember.linkedin = element['social']['linkedin'];
        teamMember.instagram = element['social']['instagram'];
        teamMember.twitter = element['social']['twitter'];
        teamMember.medium = element['social']['medium'];

        team.add(teamMember);
      }
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !isLoading
          ? Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    !ResponsiveWidget.isMediumScreen(context)
                        ? Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Image.asset(
                              Assets.team,
                              scale: 5,
                            ),
                          )
                        : Header(
                            headerImage: ThemeSwitcher.of(context).isDarkModeOn
                                ? Assets.small_header_dark
                                : Assets.small_header,
                            page: "TeamHeaderData",
                            active: "team",
                          ),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 300),
                      child: divider("Faculty Advisor"),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 300),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ResponsiveGridCol(
                            sm: 12,
                            md: 12,
                            lg: 12,
                            xl: 12,
                            child: TeamMemberCard(
                              name: team[0].name,
                              image: team[0].imageURL,
                              github: team[0].github,
                              linkedin: team[0].linkedin,
                              twitter: team[0].twitter,
                              instagram: team[0].instagram,
                              designation: team[0].designation,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CenteredView(
                      horizontal: 10,
                      vertical: 20,
                      child: ResponsiveGridRow(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(
                          team.length - 1,
                          (index) => team[index + 1].tag == null
                              ? ResponsiveGridCol(
                                  sm: 6,
                                  md: 4,
                                  lg: 3,
                                  xl: 3,
                                  child: TeamMemberCard(
                                    name: team[index + 1].name,
                                    image: team[index + 1].imageURL,
                                    github: team[index + 1].github,
                                    linkedin: team[index + 1].linkedin,
                                    twitter: team[index + 1].twitter,
                                    instagram: team[index + 1].instagram,
                                    designation: team[index + 1].designation,
                                  ),
                                )
                              : ResponsiveGridCol(
                                  sm: 12,
                                  md: 12,
                                  lg: 12,
                                  xl: 12,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: divider(team[index + 1].tag),
                                  ),
                                ),
                        ),
                      ),
                    ),
                    Footer(
                      context: context,
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
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
      margin: EdgeInsets.only(
        top: 20,
        left: 20.0,
        bottom: 20.0,
        right: 20.0,
      ),
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
                  child: Text(
                    'Unable to load or image not available',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              color: ThemeSwitcher.of(context).isDarkModeOn
                  ? Color(0xff414141)
                  : Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        html.window.open(
                            "https://www.linkedin.com/in/" + linkedin,
                            "linkedin");
                      },
                      icon: Icon(FontAwesomeIcons.linkedin)),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.twitter),
                    onPressed: () {
                      html.window.open(
                          "https://www.twitter.com/" + twitter, "twitter");
                    },
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.instagram),
                    onPressed: () {
                      html.window.open("https://www.instagram.com/" + instagram,
                          "instagram");
                    },
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.github),
                    onPressed: () {
                      html.window
                          .open("https://www.github.com/" + github, "github");
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 12.0, bottom: bio == null || bio == "" ? 12 : 0),
              width: MediaQuery.of(context).size.width,
              color: ThemeSwitcher.of(context).isDarkModeOn
                  ? Color(0xff414141)
                  : Colors.white,
              alignment: Alignment.center,
              child: Text(
                "$name\n$designation",
                textAlign: TextAlign.center,
              ),
            ),
            bio == null || bio == ""
                ? Container()
                : Container(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    width: MediaQuery.of(context).size.width,
                    color: ThemeSwitcher.of(context).isDarkModeOn
                        ? Color(0xff414141)
                        : Colors.white,
                    alignment: Alignment.center,
                    child: AutoSizeText(bio),
                  )
          ],
        ),
      ),
    );
  }
}
