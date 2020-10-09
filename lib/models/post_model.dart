class Post {
  String author, title, description, url, urlimage, publishat, content;
  Source source;

  Post(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlimage,
      this.publishat,
      this.content,
      this.source});

  factory Post.fromjson(Map<String,dynamic>json)
  {
        return Post(
            author: json["author"].toString(),
            url: json["url"].toString(),
            content: json["content"].toString(),
            description: json["description"].toString(),
            publishat: json["publishedAt"].toString(),
            title: json["title"].toString(),
            urlimage: json["urlToImage"].toString(),
            source: Source.fromjson(json["source"]),
        );
  }


}

class Source {
  String id, name;

  Source({this.id, this.name});

  factory Source.fromjson(Map<String, dynamic> jsonparse) {
    return Source(id: jsonparse["id"], name: jsonparse["name"]);
  }


}
