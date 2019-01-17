import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'themes/theme1.dart';
import 'screens/home_screen.dart';

//
class App extends StatelessWidget {
  //

  App() {
    _initLogging();
  }

  @override
  Widget build(BuildContext context) {
    //
    return MaterialApp(
      title: 'Goings',
      theme: ThemeData(
        brightness: Brightness.light,
        canvasColor: Theme1.morningSkyColor(),
        primarySwatch: Theme1.honeyShades(),
        fontFamily: 'Nunito',
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routes,
    );
  }

  //
  Route routes(RouteSettings rs) {
    //
    return MaterialPageRoute(builder: (context) {
      return Home();
    });
  }

  //
  void _initLogging() {
    //
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord rec) {
      print('${rec.time} ${rec.loggerName} ${rec.message}');
    });
  }

  //
}
