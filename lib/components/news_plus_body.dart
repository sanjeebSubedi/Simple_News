import 'package:flutter/material.dart';
import '../extras/webview_screen.dart';

class NewsBodyListView extends StatelessWidget {
  final List<Widget> newsWidgetsToShow;
  final List<String> newsUrlList;

  NewsBodyListView(
      {@required this.newsWidgetsToShow, @required this.newsUrlList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => ListTile(
              title: newsWidgetsToShow[index],
              onTap: () async {
                // shows webView of clicked news title
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebViewScreen(
                      webViewUrl: newsUrlList[index],
                      webViewTitle: newsWidgetsToShow[index],
                    ),
                  ),
                );
              },
            ),
        separatorBuilder: (context, index) => Divider(
              color: Colors.white,
              height: 1,
            ),
        itemCount: newsWidgetsToShow.length);
  }
}
