
import 'package:flutter/material.dart';
import 'package:news_app_api/views/article_view.dart';
import 'package:news_app_api/views/search.dart';
import 'package:news_app_api/views/homepage.dart';
import 'package:news_app_api/views/singleton.dart';

import '../main.dart';

Widget MyAppBar(context,bool switchValue){

  TextEditingController _tc1 = TextEditingController();
  return AppBar(

    title: Container(
      margin: EdgeInsets.only(top: 20,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[

          Text(
            "  Nimble     ",
            style:
            TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w600,),
          ),

          Text(
            "TopNews",
            style: TextStyle(color:appState.switchValue?Colors.black:Colors.white, fontWeight: FontWeight.w600),
          ),


          Container(
            padding: EdgeInsets.only(left: 100.0),
            margin: EdgeInsets.symmetric(vertical: 0.0,horizontal: 20.0),
            child: IconButton(
              icon: Icon(Icons.search),  color: appState.switchValue?Colors.black:Colors.white,onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>search()));
            },),
          ),
        ],
      ),
    ),
     backgroundColor:!appState.switchValue?Colors.black:Colors.white,
    elevation: 0.0,
  );
}


class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl, language,publishedAt;

  NewsTile({this.imgUrl, this.desc, this.title, this.content, this.language, @required this.posturl,this.publishedAt});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArticleView(
              imgUrl: imgUrl,
              title: title,
              content: content,
              publishedAt: publishedAt,
              desc: desc,
            )
        ));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(6),bottomLeft:  Radius.circular(6))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        imgUrl,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(height: 12,),
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                        color: appState.switchValue?Colors.black:Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    desc,
                    maxLines: 2,
                    style: TextStyle(color:appState.switchValue?Colors.black:Colors.white, fontSize: 14),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
