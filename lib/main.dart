import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsplus/components/news_plus_body.dart';
import 'components/bottom_bar.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    ChangeNotifierProvider.value(value: ChangeableThings(), child: NewsApp()));

//provider package at the root of the app so no widgets are lef out in case they want to listen to changes
class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('News Plus'),
            backgroundColor: Color(0xFF1F1F1F),
          ),
          body: Provider.of<ChangeableThings>(context).newsWidgetsToShow.isEmpty
              ? Container(
                  child: Center(child: CircularProgressIndicator()),
                )
              : NewsBodyListView(
                  newsWidgetsToShow:
                      Provider.of<ChangeableThings>(context).newsWidgetsToShow,
                  //widgets to show on screen can change on user's choice so values are fetched from provider package
                  newsUrlList:
                      Provider.of<ChangeableThings>(context).newsUrlList),
          bottomNavigationBar:
              BottomBar(), //bottom bar fetched from different file
        ),
      ),
    );
  }
}

class ChangeableThings extends ChangeNotifier {
  int selectedIndexOfBottomBar = 0; //index of bottom bar is 0 when app starts
  List<Widget> newsWidgetsToShow =
      []; //widgets to be shown on screen reside here
  List<String> newsUrlList = []; //url list for corresponding news
  void changeSelectedIndexOfBottomBar(int indexOfBottomBar) {
    selectedIndexOfBottomBar = indexOfBottomBar;
    notifyListeners();
  }

  void changeNewsWidgetsToShow(List<Widget> newsWidgetsPassed) {
    newsWidgetsToShow = newsWidgetsPassed;
    notifyListeners();
  }

  void changeNewsUrlList(List<String> newsUrlListPassed) {
    newsUrlList = newsUrlListPassed;
    notifyListeners();
  }
}
