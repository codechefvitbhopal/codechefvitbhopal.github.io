class Blog {
  String title;
  String pubDate;
  String link;
  String guid;
  String author;
  String thumbnail;
  String description;
  String content;
  List<dynamic> categories;

  Blog(
      {this.title,
      this.pubDate,
      this.link,
      this.guid,
      this.author,
      this.thumbnail,
      this.description,
      this.content,
      this.categories});

  Blog.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    pubDate = json['pubDate'];
    guid = json['guid'];
    author = json['author'];
    thumbnail = json['thumbnail'];
    description = json['description'];
    content = json['content'];
    categories = json['categories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['pubDate'] = this.pubDate;
    data['title'] = this.guid;
    data['pubDate'] = this.author;
    data['title'] = this.thumbnail;
    data['title'] = this.description;
    data['pubDate'] = this.content;
    data['pubDate'] = this.categories;
    return data;
  }
}
