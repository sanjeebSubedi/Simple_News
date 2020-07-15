import 'package:flutter/material.dart';

List<BottomNavigationBarItem> getBNBItems() {
  List<BottomNavigationBarItem> bottomBarIcons = [
    BottomNavigationBarItem(
      icon: Icon(Icons.flash_on),
      title: Text('Headlines'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.laptop),
      title: Text('Technology'),
    ),
  ];
  return bottomBarIcons;
}
