import 'package:flutter/material.dart';

List<Text> convertStringListToTextList(List<String> listOfStrings) {
  List<Text> textList = [];
  for (String i in listOfStrings) {
    Text tempText = Text(i);
    textList.add(tempText);
  }
  return textList;
}
