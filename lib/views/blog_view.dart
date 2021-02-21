import 'dart:html' as html;

import 'package:ccvit/config/constants.dart';
import 'package:ccvit/models/blog_model.dart';
import 'package:ccvit/providers/api_provider.dart';
import 'package:ccvit/widgets/blog_widget.dart';
import 'package:ccvit/widgets/centeredView/centered_view.dart';
import 'package:ccvit/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

class BlogTab extends StatefulWidget {
  @override
  _BlogTabState createState() => _BlogTabState();
}

class _BlogTabState extends State<BlogTab> {
  ApiProvider _apiProvider = ApiProvider();
  List<Blog> _blogs = [];
  bool _loadingData = true;
  bool _showError = false;

  @override
  void initState() {
    super.initState();
    loadBlogs();
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
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          RaisedButton(
            child: Text(
              'Retry',
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: Colors.white),
            ),
            elevation: 0.0,
            onPressed: loadBlogs,
          )
        ],
      ));
    }
    return Scaffold(
      body: CenteredView(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Articles",
                  style: TextStyle(
                    fontSize: 36.0,
                  ),
                ),
              ),
              ResponsiveWidget(
                largeScreen: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 2,
                      child: blogList(),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    )
                  ],
                ),
                smallScreen: blogList(),
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

  Widget blogList() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListView.builder(
                itemCount: _blogs.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    BlogWidget(_blogs[index], index, _blogs.length)),
            ElevatedButton(
              child: Text(
                'More',
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: Colors.white),
              ),
              onPressed: () =>
                  html.window.open(Constants.PROFILE_MEDIUM, 'ankitsagar'),
            )
          ],
        ),
      ),
    );
  }

  void loadBlogs() async {
    setState(() {
      _loadingData = true;
      _showError = false;
    });
    final result = await _apiProvider.getBlogs();
    setState(() {
      if (result == null) {
        _showError = true;
        _loadingData = false;
      } else {
        _blogs = result;
        _showError = false;
        _loadingData = false;
      }
    });
  }
}
