import 'package:douban_demo/models/TopMovie.dart';
import 'package:flutter/cupertino.dart';
import 'package:douban_demo/http.dart';
import 'package:douban_demo/config.dart';
import 'package:douban_demo/models/index.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  List<Subjects> _movieList = new List();
  List _listTitles = new List();
  ScrollController _scrollController = new ScrollController();
  int _start = 0;


  @override
  void initState() {
    super.initState();
      _getMovieListTitles();
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _getMovieListTitles();
      }
    });
  }

  void dispose(){
    super.dispose();
    print("dispose");
  }

  _getMovieListTitles() {
    dio.get(host + '/movie/top250',queryParameters: {'count':20,'start':_start}).then((response) {
      print(response.data);
      var topMovie = TopMovie.fromJson(response.data);
      print(topMovie.title);
      _start += 20;
      setState(() {
        _movieList.addAll(topMovie.subjects);
        _listTitles.addAll(_getListTitles(topMovie.subjects));
      });
    }).catchError((e) {
      print(e);
    }).whenComplete(() {
      setState(() {
        print("done");
      });
    });
  }

  _getdirectorsName(Subjects subject){
    String directorsName = "";
    for (Directors director in subject.directors) {
        directorsName += director.name;
        directorsName += " ";
    }
    return directorsName;
  }

  _getGenres(Subjects subject){
    String genresTitle = "";
    for (var genre in subject.genres) {
      genresTitle += ' / ';
      genresTitle += genre;
    }
    return genresTitle;
  }

  List _getListTitles(List movieLists) {
    List listTitles = new List();
    for (var movie in movieLists) {
      int index = movieLists.indexOf(movie) + 1 + (_movieList.length - 20);

      Column column = new Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.only(left: 8,top: 5),
                      child:  new Text('NO.' '$index',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                    ),
                    new Container(
                      child: new Image.network(
                        movie.images.large,
                        width: 60,
                        height: 80,
                        fit: BoxFit.fill, 
                      ),
                      padding: EdgeInsets.all(8.0),
                    ),
                  ],
                ),
            new  Expanded(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(movie.title),
                  Text('导演: ' + _getdirectorsName(movie)),
                  Text(movie.year.toString() + _getGenres(movie)),
                  Text('评分: ' + movie.rating.average.toString()),
                ],
              ),
              ),
            ],
          ),
          new Divider(color: Colors.grey, height: 2.0)
        ],
      );
      listTitles.add(column);
    }
    return listTitles;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
      itemCount: _listTitles.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == _listTitles.length) {
          return Center(
            child: new Container(
              child: SizedBox(
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  backgroundColor: Colors.grey,
                ),
              ),
            ),
          );
        }
        return _listTitles[index];
      },
      controller: _scrollController,
    ));
  }
}
