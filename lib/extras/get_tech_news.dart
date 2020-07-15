import 'dart:convert';
import 'package:http/http.dart' as http;

class GetTechNews {
  static const String ID_URL =
      'https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty&orderBy=%22\$key%22&limitToFirst=15';

  static Future<List> getNewsId() async {
    http.Response response1 = await http.get(ID_URL);
    List data = jsonDecode(response1.body);
    return data;
  }

  static Future<List> getNewsTitleAndUrl(int newsId) async {
    List<String> newsDetails = [];
    http.Response response2 = await http
        .get('https://hacker-news.firebaseio.com/v0/item/$newsId.json');
    var data = jsonDecode(response2.body);
    String title = data['title'];
    String newsUrl = data['url'];
    newsDetails.add(title);
    newsDetails.add(newsUrl);
    return newsDetails;
  }
}
