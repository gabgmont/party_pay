import 'package:flutter/cupertino.dart';

class NewsController {
  int currentPage = 0;

  NewsController() {

  }

  void changeNews(VoidCallback onStart) async {
    onStart();
    // Future.delayed(Duration(seconds: 5)).then((value) {
    //   currentPage + 1;
    //   if (currentPage == 5) currentPage = 0;
    // });
  }
}
