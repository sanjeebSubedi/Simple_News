import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:newsplus/extras/convert_stringList_to_textWidgetList.dart';
import 'extras/get_tech_news.dart';

Future<List<List>> fetchTechNewsTitleAndUrl() async {
  List allNewsIds = await GetTechNews.getNewsId();
  List<Text> techNewsTitleList = [];
  List<String> techNewsUrlList = [];
  int numberOfNews = allNewsIds.length;
  for (int i = 0; i < numberOfNews; i++) {
    List<String> newsTitleAndUrl =
        await GetTechNews.getNewsTitleAndUrl(allNewsIds[i]);
    Text textConvertedTitle = Text(newsTitleAndUrl[0]);
    techNewsTitleList.add(textConvertedTitle);
    techNewsUrlList.add(newsTitleAndUrl[1]);
  }
  List<List> newsTitleAndUrlList = [techNewsTitleList, techNewsUrlList];
  return newsTitleAndUrlList;
}

Future<List<List>> fetchHeadlineNewsTitleAndUrl() async {
  String url = 'http://newsapi.org/v2/top-headlines?country=us';
  String apiKey = 'c15a8fae8c0543a191bbe29ddde5081b';
  Map<String, String> headers = {
    'x-api-key': apiKey
  }; //api needs api key in header of api call
  http.Response response = await http.get(url, headers: headers);
  print(response.statusCode);
  List<String> listOfHeadlines = [];
  List<String> headlineUrlList = [];
  List<Text> listOfHeadlinesInText = [];
  var data = jsonDecode(response.body);
  var articleList = data['articles'];
  for (int i = 0; i < articleList.length; i++) {
    String temp1 = articleList[i]['title'];
    String temp2 = articleList[i]['url'];
    listOfHeadlines.add(temp1);
    headlineUrlList.add(temp2);
  }
  listOfHeadlinesInText = convertStringListToTextList(listOfHeadlines);

  List<List> headlineTitleAndUrlList = [listOfHeadlinesInText, headlineUrlList];
  return headlineTitleAndUrlList;
}
