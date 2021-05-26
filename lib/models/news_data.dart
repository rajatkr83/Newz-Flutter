class NewsData {

  //using ? here for the null-safety.
  String? author, title, description, url, urlToImage, content;
  DateTime? publishedAt;

  NewsData({this.urlToImage, this.author, this.title, this.description, this.url, this.content, this.publishedAt});

}