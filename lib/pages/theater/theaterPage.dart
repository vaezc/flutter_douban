import 'package:douban_demo/models/theaters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:douban_demo/http.dart';
import 'package:douban_demo/config.dart';
import 'package:douban_demo/models/index.dart';


class TheaterPage extends StatefulWidget {
  @override
  _TheaterPageState createState() => _TheaterPageState();
}

class _TheaterPageState extends State<TheaterPage> {
  int _start = 0;
  int _count = 20;
  List _theaterList = new List();
  List _theaterWidgetList = new List();

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData(){
    dio.get(host+'/movie/in_theaters',queryParameters: {'start':_start,'count':_count}).then((response){
      print(response.data);
      var theaters = Theater.fromJson(response.data);
      setState(() {
        _theaterList.addAll(theaters.subjects);
        _theaterWidgetList.addAll(getTheaterListWidget(theaters.subjects));   
      });
    }).catchError((error){
      print(error);
    }).whenComplete((){
      setState(() {
        
      });
    });
  }

   List getTheaterListWidget(List <Subjects>subjects){
     List itemList = new List();
     for (Subjects subject in subjects) {
       Column column = new Column(
         children: <Widget>[
           new Expanded(
              child: 
              Padding(
                padding: EdgeInsets.only(top: 5),
                child:new Image.network(     
                subject.images.large,
                fit: BoxFit.fill, 
              ),
           ),
           ),
          Text(subject.title,maxLines: 1,),
         ],
       );
       itemList.add(column);
     }
     return itemList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
        ),
         itemCount: _theaterWidgetList.length,
         itemBuilder: (context,index){
           if(index == 0){
           }
            return _theaterWidgetList[index];
         }, 
        
      ),
    );
  }
}