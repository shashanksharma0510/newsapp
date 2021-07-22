


import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_api/provider/connection_provider.dart';
import 'package:news_app_api/views/homepage.dart';
import 'package:connectivity/connectivity.dart';
import 'package:news_app_api/views/no_internet.dart';
import 'package:provider/provider.dart';
void main() async {
  runApp(
    EasyDynamicThemeWidget(
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (Context){
       ConnectionProvider connectionProvider = ConnectionProvider();
       connectionProvider.initialConnection();
       return connectionProvider;
      },
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
        title: 'nimble TopNews',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: EasyDynamicTheme.of(context).themeMode,
          home: Consumer<ConnectionProvider>
            (
              builder: (context, connection, child) {
                return connection.isConnected? new HomePage(): NoInternet();
              },
              ),
      ),
    );
  }
}


