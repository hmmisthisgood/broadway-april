class Post {
  final int? userId;
  final int id;
  final String body;
  final String title;
  final String? contact;

  Post(
      {required this.userId,
      required this.id,
      required this.body,
      required this.title,
      this.contact});

  factory Post.convertToDart(Map json) {
    return Post(
      userId: json["userId"],
      id: json["id"],
      body: json["body"],
      title: json["title"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "id": id,
      "title": title,
      "body": body,
    };
  }
}
