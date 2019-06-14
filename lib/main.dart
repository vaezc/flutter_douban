import 'package:flutter/material.dart';
import 'pages/home/home.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'douban',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
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
  int _selectedIndex = 0;
  static const TextStyle optionstyle = TextStyle(fontSize: 30,fontWeight: FontWeight.bold);


  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: const Text('Dou ban')),
     body: Center(
       child:new HomeWidget(),
     ),
     bottomNavigationBar: BottomNavigationBar(
       items: const <BottomNavigationBarItem>[
         BottomNavigationBarItem(
           icon: Icon(Icons.home),
           title: Text('Home')
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.business),
           title: Text('Business')
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.school),
           title: Text('School')
         ),
       ],
       currentIndex: _selectedIndex,
       selectedItemColor: Colors.amber[800],
       onTap: _onItemTapped,
     ),
   );
   
  }
}
