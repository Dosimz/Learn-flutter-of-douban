import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:movie_top_250/View/List/movieListViewWidget.dart';


void main() { 
  runApp(App());
  if (Platform.isAndroid) {
    // 设置沉浸式状态栏
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    
  }
}
class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '豆瓣电影 Top250',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MovieWidget(),
    );
  }
}

