import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import './ui/themes/theme1.dart';
import './ui/screens/home_screen.dart';

//
class App extends StatelessWidget {
  //

  @override
  Widget build(BuildContext context) {
    //
  
    _initLogging();

    return MaterialApp(
      title: 'Goings',
      theme: ThemeData(
        brightness: Brightness.light,
        canvasColor: Theme1.morningSkyColor(),
        primarySwatch: Theme1.honeyShades(),
        fontFamily: 'Nunito',
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(title: 'Goings'),
    );
  }

  //
  void _initLogging() {
    //

    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord rec) {
      print('${rec.time} ${rec.loggerName} ${rec.message}');
    });
  }
}
