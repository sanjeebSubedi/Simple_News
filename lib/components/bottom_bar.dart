import 'package:flutter/material.dart';
import 'package:newsplus/components/bottom_navigation_bar_items.dart';
import 'package:newsplus/main.dart';
import 'package:provider/provider.dart';
import 'package:newsplus/fetch_all_news.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<Text> headlineNewsTitleList = [];
  List<String> headlineNewsUrlList = [];
  List<Text> techNewsTitleList = [];
  List<String> techNewsUrlList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllNews();
  }

  void getAllNews() async {
    List<List> headlineData =
        await fetchHeadlineNewsTitleAndUrl(); //retrieves headline news and url
    headlineNewsTitleList = headlineData[0]; //unpack
    headlineNewsUrlList = headlineData[1];
    changeScreenToShowHeadlineNews();

    List<List> techData =
        await fetchTechNewsTitleAndUrl(); //retrieves tech news and url
    techNewsTitleList = techData[0]; //unpack
    techNewsUrlList = techData[1];
    if ((Provider.of<ChangeableThings>(context, listen: false)
            .selectedIndexOfBottomBar) ==
        1) changeScreenToShowTechNews();
  }

  void changeScreenToShowTechNews() {
    //updates the widgets which are controlled by the provider package
    Provider.of<ChangeableThings>(context, listen: false)
        .changeNewsWidgetsToShow(techNewsTitleList);
    Provider.of<ChangeableThings>(context, listen: false)
        .changeNewsUrlList(techNewsUrlList);
  }

  void changeScreenToShowHeadlineNews() {
    Provider.of<ChangeableThings>(context, listen: false)
        .changeNewsWidgetsToShow(headlineNewsTitleList);
    Provider.of<ChangeableThings>(context, listen: false)
        .changeNewsUrlList(headlineNewsUrlList);
  }

  void onItemTapped(int index) {
    Provider.of<ChangeableThings>(context, listen: false)
        .changeSelectedIndexOfBottomBar(index);
    switch (index) {
      case 0:
        changeScreenToShowHeadlineNews();
        break;
      case 1:
        changeScreenToShowTechNews();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: getBNBItems(),
      backgroundColor: Color(0xFF1F1F1F),
      currentIndex:
          Provider.of<ChangeableThings>(context).selectedIndexOfBottomBar,
      showUnselectedLabels: true,
      onTap: onItemTapped,
      selectedItemColor: Colors.teal,
      selectedFontSize: 12,
      unselectedFontSize: 12,
    );
  }
}
