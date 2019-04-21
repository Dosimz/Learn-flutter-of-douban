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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(245, 245, 245, 1),
        scaffoldBackgroundColor: Color.fromRGBO(245, 245, 245, 1), 
      ),
      home: MovieWidget(),
    );
  }
}

