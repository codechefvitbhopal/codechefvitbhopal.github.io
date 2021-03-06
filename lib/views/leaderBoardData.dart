import 'package:ccvit/widgets/centeredView/centered_view.dart';
import 'package:ccvit/widgets/theme_inherited_widget.dart';
import 'package:flutter/material.dart';

import '../models/sheetModel.dart';
import '../controller/sheetController.dart';
import 'dart:html' as html;

class LeaderBoarData extends StatefulWidget {
  final String url;
  LeaderBoarData({this.url});
  @override
  _LeaderBoarDataState createState() => _LeaderBoarDataState();
}

class _LeaderBoarDataState extends State<LeaderBoarData> {
  bool _loadingData = true;
  List<LeaderBoardModel> leaderBoardItems = <LeaderBoardModel>[];

  bool _showError = true;

  @override
  void initState() {
    super.initState();
    getLeaderBoardData();
  }

  void getLeaderBoardData() {
    try {
      SheetController(url: widget.url)
          .getRankingList()
          .then((leaderBoardItems) {
        setState(() {
          this.leaderBoardItems = leaderBoardItems.reversed.toList();

          _showError = false;
          _loadingData = false;
        });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loadingData)
      return Center(
        child: CircularProgressIndicator(),
      );
    if (_showError) {
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
              'Retry',
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: Colors.white),
            ),
            onPressed: getLeaderBoardData,
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
                  child: Text(
                    "LeaderBoard",
                    style: TextStyle(
                      fontSize: 36.0,
                    ),
                  ),
                ),
                Container(
                  height: 500,
                  child: ListView.builder(
                    itemCount: leaderBoardItems.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          color: ThemeSwitcher.of(context).isDarkModeOn
                              ? Colors.grey
                              : Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            leaderBoardItems[index].rank.isNotEmpty
                                ? Container(
                                    // margin: EdgeInsets.all(8.0),
                                    padding: EdgeInsets.all(
                                      20.0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        bottomLeft: Radius.circular(20.0),
                                      ),
                                      color: Colors.blue,
                                    ),
                                    child: Center(
                                      child: Text(
                                        leaderBoardItems[index].rank,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(leaderBoardItems[index].name),
                            ),
                            leaderBoardItems[index].score.isNotEmpty
                                ? Container(
                                    // margin: EdgeInsets.all(8.0),
                                    padding: EdgeInsets.all(
                                      20.0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20.0),
                                        bottomRight: Radius.circular(20.0),
                                      ),
                                      color: Colors.blue,
                                    ),
                                    child: Center(
                                      child: Text(
                                        leaderBoardItems[index].score,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      );
                    },
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
