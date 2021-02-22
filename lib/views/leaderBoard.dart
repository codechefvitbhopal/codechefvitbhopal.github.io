import 'package:ccvit/models/leaderBoard.dart';
import 'package:ccvit/widgets/centeredView/centered_view.dart';
import 'package:ccvit/widgets/theme_inherited_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/sheetModel.dart';
import '../controller/sheetController.dart';

class LeaderBoardView extends StatefulWidget {
  @override
  _LeaderBoardViewState createState() => _LeaderBoardViewState();
}

class _LeaderBoardViewState extends State<LeaderBoardView> {
  bool _loadingData = true;
  List<LeaderBoard> leaderboarditem = <LeaderBoard>[];
  List<LeaderBoardModel> leaderBoardItems = <LeaderBoardModel>[];

  bool _showError = true;

  @override
  void initState() {
    super.initState();
    getLeaderBoardData();
  }

  void getLeaderBoardData() {
    try {
      SheetController().getFeedbackList().then((leaderBoardItems) {
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
                            Container(
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
                            ),
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
