import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:news_app_api/helper/data.dart';
import 'package:news_app_api/helper/widgets.dart';
import 'package:news_app_api/models/categorie_model.dart';
import 'package:news_app_api/views/categorie_news.dart';
import 'package:news_app_api/views/singleton.dart';
import '../helper/news.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  bool _loading;
  var newslist;
  bool _switchValue = false;

  List<CategorieModel> categories = List<CategorieModel>();

  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _switchValue? Colors.white: Colors.black,
      appBar: MyAppBar(context,_switchValue),


      body: SafeArea(
        child: _loading
            ? Center(
          child: CircularProgressIndicator(),
        )

            : SingleChildScrollView(
          child: Container(
            color: !appState.switchValue?Colors.black:Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 10.0,),
                  padding: EdgeInsets.only(left: 20.0),
                  child: Row(

                    children: <Widget>[
                      Text(
                        "Dark",
                        style:
                        TextStyle(color:appState.switchValue?Colors.black:Colors.white, fontWeight: FontWeight.w600,fontSize: 20.0),
                      ),
                      Switch(
                      value: appState.switchValue,
                      onChanged:(newValue){
                        setState(() {
                          EasyDynamicTheme.of(context).changeTheme();
                          appState.switchValue = newValue;
                        });
                      } ),
                      Text(
                        "Light",
                        style:
                        TextStyle(color:appState.switchValue?Colors.black:Colors.white, fontWeight: FontWeight.w600,fontSize: 20.0),
                      ),
                    ],
                  ),
                ),



                /// Categories
                Container(
                  color: !appState.switchValue?Colors.black:Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 80,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoryCard(
                          imageAssetUrl: categories[index].imageAssetUrl,
                          categoryName: categories[index].categorieName,
                        );
                      }),
                ),

                /// News Article
                Container(
                  color: !appState.switchValue?Colors.black:Colors.white,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

}

class CategoryCard extends StatelessWidget {
  final String imageAssetUrl, categoryName;

  CategoryCard({this.imageAssetUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => CategoryNews(
              newsCategory: categoryName.toLowerCase(),
            )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 14),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: imageAssetUrl,
                height: 80,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 80,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black26
              ),
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}

