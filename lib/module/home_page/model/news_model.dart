class NewsModel{
  int?id;
  String?title;
  String?body;
  NewsModel({this.body,this.title,this.id});
  factory NewsModel.fromJson(Map<String, dynamic> json) {

    return
      NewsModel(
          id: json["id"],
          title: json['title'],
          body: json['body'],
      );
  }
}