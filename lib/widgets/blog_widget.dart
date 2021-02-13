import 'package:ccvit/models/blog_model.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:html/parser.dart';

class BlogWidget extends StatelessWidget {
  final Blog blog;
  final index;
  final length;
  const BlogWidget(this.blog, this.index, this.length);

  @override
  Widget build(BuildContext context) {
    double topBottomPadding = (index == 0 || index == length - 1) ? 16.0 : 8.0;
    return InkWell(
      onTap: () => html.window.open(blog.link, blog.author),
      child: Card(
        margin:
            EdgeInsets.fromLTRB(16.0, topBottomPadding, 16.0, topBottomPadding),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                blog.thumbnail,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                blog.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                  parse(blog.description.substring(0, 60)).body.text +
                      " ...Read more",
                  style: Theme.of(context).textTheme.subtitle2),
            ],
          ),
        ),
      ),
    );
  }
}
