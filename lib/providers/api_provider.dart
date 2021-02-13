import 'dart:convert';
import 'package:ccvit/models/blog_model.dart';
import 'package:ccvit/config/constants.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  List<Blog> blogs = <Blog>[];

  Future<List<Blog>> getBlogs() async {
    var response = await http.get(Constants.BLOG_API);
    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      jsonData['items'].forEach((element) {
        Blog blog = Blog();
        blog.title = element['title'];
        blog.pubDate = element['pubDate'];
        blog.categories = element['categories'];
        blog.content = element['content'];
        blog.description = element['description'];
        blog.guid = element['guid'];
        blog.link = element['link'];
        blog.thumbnail = element['thumbnail'];
        blog.author = element['author'];

        blogs.add(blog);
      });
      return blogs;
    } else {
      print(response.statusCode);
      throw (response.statusCode);
    }
  }
}

// class ApiProvider {
//   Future<List<Blog>> getBlogs() async {
//     final response = await http.get(Constants.BLOG_API);

//     if (response.statusCode == 200) {
//       List blogs = json.decode(response.body);
//       print("blogs Ankit  $blogs");
//       final results = blogs.map((blog) => Blog.fromJson(blog)).toList();

//       return results;
//     } else {
//       print(response.statusCode);
//       throw (response.statusCode);
//     }
//   }
// }
