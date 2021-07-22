

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:news_app_api/helper/data.dart';
import 'package:news_app_api/helper/news.dart';
import 'package:news_app_api/helper/widgets.dart';
import 'package:news_app_api/models/article.dart';
import 'package:news_app_api/models/categorie_model.dart';
import 'package:news_app_api/views/singleton.dart';


import 'homepage.dart';
import 'singleton.dart';
class search extends StatefulWidget {
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  bool _loading;
  List newslist=[];

  List<CategorieModel> categories = List<CategorieModel>();

  String _search;
  int pressed = 0 ;
  List<News> searchNews;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: !appState.switchValue?Colors.black:Colors.white,
      appBar: AppBar(
          backgroundColor: !appState.switchValue?Colors.black:Colors.white,
          title:Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width:MediaQuery.of(context).size.width*0.6,
              child: TextField(
                onChanged: (value){
                  _search=value;
                  setState(() {

                  });
                },
                decoration: InputDecoration(
                    hintText: 'Search'
                ),

              ),
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),color: appState.switchValue?Colors.black:Colors.white,
            onPressed: () async{
              News r=News();
              newslist=await  r.getSearchNews(_search);
              setState(() {
                pressed++;
              });
            },
          )
        ]

      ),

    body:  (pressed == 0) ? Container(margin: EdgeInsets.all(100.0),alignment: Alignment.center,
          child: Text('Searching......',style: TextStyle(color: appState.switchValue?Colors.black:Colors.white, fontWeight: FontWeight.w500,fontSize: 35,
              fontStyle: FontStyle.italic,),),
    ) : SingleChildScrollView(
      child: newslist.length == 0 ?
          Container(margin: EdgeInsets.all(100.0),alignment: Alignment.center,
         child: Column(
           children:  [
           Text('OOPS!',style: TextStyle(color: appState.switchValue?Colors.black:Colors.white, fontWeight: FontWeight.w600,fontSize: 40,
           fontStyle: FontStyle.normal,),),
             Text('Not Found..',style: TextStyle(color: appState.switchValue?Colors.black:Colors.white, fontWeight: FontWeight.w600,fontSize: 20,
               fontStyle: FontStyle.italic,),),
           ],
         ),
          ):
      Container(color: !appState.switchValue?Colors.black:Colors.white,
        margin: EdgeInsets.only(top: 20),
        child: ListView.builder(
            itemCount: newslist.length,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return NewsTile(
                imgUrl: newslist[index].urlToImage ?? "",
                title: newslist[index].title ?? "",
                desc: newslist[index].description ?? "",
                content: newslist[index].content ?? "",
                posturl: newslist[index].articleUrl ?? "",
                publishedAt:newslist[index].publishedAt ??'',
              );
            }),
      ),

    ),
    );
  }
}






