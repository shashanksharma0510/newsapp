import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app_api/views/singleton.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String imgUrl, title, desc, content, posturl, language,publishedAt;

  ArticleView({this.imgUrl, this.desc, this.title, this.content, this.language, @required this.posturl,this.publishedAt});


  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {


  final Completer<WebViewController> _controller = Completer<
      WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: !appState.switchValue?Colors.black:Colors.white,

        appBar: new AppBar(
          iconTheme: IconThemeData(
              color: appState.switchValue?Colors.black:Colors.white
          ),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   "Nimble",
            //   style:
            //   TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w600),
            // ),
            //
            // Text(
            //   "TopNews",
            //   style: TextStyle(
            //       color: Colors.black, fontWeight: FontWeight.w600),
            // ),

          ],
        ),
        actions: <Widget>[
          Container(
            color: !appState.switchValue?Colors.black:Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                color: !appState.switchValue?Colors.black:Colors.white,
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.all(0.0),
                child: Row(
                  children: [
                    Icon(Icons.bookmark_border,size: 25,color: appState.switchValue?Colors.black:Colors.white,),
                    Icon(Icons.person_add_alt_1_rounded,size: 25,color: appState.switchValue?Colors.black:Colors.white,),
                    IconButton(icon:  Icon(Icons.access_alarm_sharp,size: 25,color: appState.switchValue?Colors.black:Colors.white,), onPressed: (){

          }),
                    Icon(Icons.share,size: 25,color: appState.switchValue?Colors.black:Colors.white,),
                  ],
                ),
              ))
        ],
        backgroundColor: !appState.switchValue?Colors.black:Colors.white,
        elevation: 0.0,

      ),

      // body: Con

      body:SingleChildScrollView(
        child: Container(
          color: !appState.switchValue?Colors.black:Colors.white,
          width:MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
           //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.all(10),
                    child: Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: appState.switchValue?Colors.black:Colors.white),)),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Text(widget.desc,style: TextStyle(color: appState.switchValue?Colors.black:Colors.white,fontSize: 22,),)),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Text(widget.publishedAt,style: TextStyle(color: appState.switchValue?Colors.black:Colors.white,fontSize: 20),)),
                SizedBox(height: 30,),
                Image.network(widget.imgUrl,width:MediaQuery.of(context).size.width ,height: 300,fit: BoxFit.fill,),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Text(widget.content,style: TextStyle(color: appState.switchValue?Colors.black:Colors.white,fontSize: 20),)),
              ],
            ),
          ),

        ),
      )


    );
  }
}