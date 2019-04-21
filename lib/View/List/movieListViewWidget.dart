import 'package:flutter/material.dart';
import 'package:movie_top_250/Service/movieApi.dart';
import 'package:movie_top_250/Model/movieModel.dart';
import 'package:movie_top_250/View/List/movieListViewRowWidget.dart';
import 'package:movie_top_250/View/List/drawerList.dart';

class MovieWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DouBanMovieState();
  }
}

class _DouBanMovieState extends State<MovieWidget> with TickerProviderStateMixin{

  AnimationController controller;
  Animation<double> animation;

  // 数据源
  List<Movie> movies = [];
  // 分页
  int page = 0;
  // 收藏
  // final _saved = new Set<Movie>();

  @override
  void initState() {
    super.initState();
    _requestData();
    //创建 AnimationController 对象
    controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 2500));
    final CurvedAnimation curve = CurvedAnimation(
      parent: controller, curve: Curves.elasticOut);
        //创建 Tween 对象 创建 Animation 对象
    animation = Tween(begin: 0.0, end: 220.0).animate(curve)
      ..addListener((){
        setState(() {}); //重绘
      });
    controller.forward();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.fromLTRB(animation.value, 0, 0, 0),
          child: Text('影榜'),
        ),
        elevation: 0,
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context){
            return IconButton(
              icon: const Icon(Icons.all_out),
              onPressed: (){
                Scaffold.of(context).openDrawer(); 
              }, 
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: new Drawer(
        child: HomeBuilder.homeDrawer(),
      ),
      body: new RefreshIndicator(
        child: _buildList(context),
        onRefresh: _requestData,
        color: Colors.black,
      ),
    );
  }

  // 下拉刷新
  Future<Null> _requestData() async {
    movies.clear();
    await MovieAPI().getMovieList(0).then((moviesData) {
      setState(() {
        movies = moviesData.movies;
      });
    });
    return;
  }

  // 上拉加载
  _requestMoreData(int page) {
    print('page = $page');
    MovieAPI().getMovieList(page).then((moviesData) {
      setState(() {
        movies += moviesData.movies;
      });
    });
  }

  // body List Widget
  Widget _buildList(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    if (movies.length != 0) {
      return ListView.separated(
          itemBuilder: (context, index) {
            // 还剩 15 条数据的时去拉取新数据
            if (movies.length - index == 15) {
              _requestMoreData(++page);
            }
            return new Container(
              width: screenWidth,
              child: buildListRow(index, movies[index], context),
            );
          },
          separatorBuilder: (context, index) => Divider(
                height: 1,
              ),
          itemCount: movies.length);
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

}




