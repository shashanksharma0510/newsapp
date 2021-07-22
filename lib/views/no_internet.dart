import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_api/views/singleton.dart';

class NoInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: !appState.switchValue?Colors.black:Colors.white,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(alignment: Alignment.center,margin: EdgeInsets.only(top:70.0),
              padding: EdgeInsets.only(right: 10.0,left: 10.0),
               child: Image(
                 image: AssetImage("assets/nointernet-png.png",),
               ),
            ),
            SizedBox(height: 60.0,),
            Text('No internet connection found.'
                'check your connection ',style:
            TextStyle(color: appState.switchValue?Colors.black:Colors.white, fontWeight: FontWeight.w600,fontSize: 20,
                fontStyle: FontStyle.italic,)),
          ],
        ),
      ),
    );
  }
}
