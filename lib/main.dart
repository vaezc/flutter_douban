import 'package:douban_demo/pages/theater/theaterPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pages/home/homePage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'douban',
      theme: CupertinoThemeData(primaryColor: Colors.green),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const TextStyle optionStyle = TextStyle(fontSize: 30,fontWeight: FontWeight.bold);

  static  List<Widget> _widgetOption = <Widget>[
      HomeWidget(),
      TheaterPage(),
      Text(
        'Index 2 : School',
        style:optionStyle,
      ),
  ];

  static List _titles = ['Top 250','正在上映','School'];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items:  const <BottomNavigationBarItem>[
         BottomNavigationBarItem(
           icon: Icon(Icons.local_movies),
           title: Text('TOP 250')
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.movie),
           title: Text('正在上映')
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.school),
           title: Text('School')
         ),
       ],
      ),
      tabBuilder: (BuildContext context, int index){
        return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(_titles[index],style: TextStyle(color: Colors.white),),
              backgroundColor: Colors.green,
            ),
            child: _widgetOption.elementAt(index),
        );
      },
    );
  }
}
