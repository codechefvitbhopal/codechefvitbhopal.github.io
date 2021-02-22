import 'dart:html' as html;
import 'package:ccvit/models/blog_model.dart';
import 'package:ccvit/providers/api_provider.dart';
import 'package:ccvit/widgets/centeredView/centered_view.dart';
import 'package:ccvit/widgets/theme_inherited_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

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
              blogList(),
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ResponsiveGridRow(
        children: List.generate(
          _blogs.length,
          (index) => ResponsiveGridCol(
            xs: 12,
            sm: 6,
            md: 6,
            lg: 3,
            xl: 3,
            child: BlogCard(
              name: _blogs[index].title,
              image: _blogs[index].thumbnail,
              des: _blogs[index].description,
              link: _blogs[index].link,
            ),
          ),
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

class BlogCard extends StatelessWidget {
  final String name;
  final String image;
  final String des;
  final String link;

  const BlogCard({
    Key key,
    this.name,
    this.image,
    this.des,
    this.link,
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
              padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
              width: MediaQuery.of(context).size.width,
              color: ThemeSwitcher.of(context).isDarkModeOn
                  ? Color(0xff414141)
                  : Colors.white,
              alignment: Alignment.center,
              child: Text(
                "$name",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () => html.window.open(link, "medium"),
              child: Container(
                padding: const EdgeInsets.only(bottom: 6.0, top: 6.0),
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text(
                  "Read this article",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
