import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'themes/theme1.dart';
import 'screens/home_scr.dart';
import 'screens/mgmt_tags_scr.dart';

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
        textTheme: TextTheme(
          body1: TextStyle(fontSize: 16.0),
          body2: TextStyle(fontSize: 14.0),
        ),
        dividerColor: Theme1.mistColor(),
        splashColor: Theme1.honeyColor(),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _generatedRoutes,
      routes: _namedRoutes(context),
    );
  }

  //
  Map<String, Widget Function(BuildContext)> _namedRoutes(BuildContext context) {
    //
    return {
      '/': (ctx) => HomeScreen(),
      '/manage-tags': (ctx) => ManageTagsScreen(),
    };
  }

  //
  Route _generatedRoutes(RouteSettings rs) {
    //
    return MaterialPageRoute(builder: (context) {
      return HomeScreen();
    });
  }

  //
  void _initLogging() {
    //
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord rec) {
      print('${rec.time} [${rec.loggerName}] ${rec.message}');
    });
  }

  //
}
