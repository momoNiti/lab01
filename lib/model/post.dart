class Post {
  final int userID;
  final int id;
  final String title;
  final String body;

  Post({this.userID, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      userID: json["userID"] as int,
      id: json["id"] as int,
      title: json["title"] as String,
      body: json["body"] as String,

    );
  }
}