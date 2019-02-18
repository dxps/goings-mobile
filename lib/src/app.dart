import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './actions/list/actions_list_bloc.dart';
import './themes/theme1.dart';
import './screens/home_scr.dart';
import './screens/mgmt_tags_scr.dart';

///
/// App startup.
///
class App extends StatefulWidget {
  //

  @override
  AppState createState() {
    return new AppState();
  }

  //
}

///
/// App's startup state.
///
class AppState extends State<App> {
  //

  static final Logger _log = Logger('AppState');

  ActionsListBloc actionsListBloc;

  AppState() {
    _initLogging();
    this.actionsListBloc = ActionsListBloc();
    _log.finer('build > Created ActionsListBloc #${actionsListBloc.hashCode}');
  }

  @override
  Widget build(BuildContext context) {
    //
    return BlocProvider<ActionsListBloc>(
      bloc: actionsListBloc,
      child: MaterialApp(
        title: 'Goings',
        theme: ThemeData(
          brightness: Brightness.light,
          canvasColor: Theme1.morningSkyColor(),
          primarySwatch: Theme1.honeyShades(),
          fontFamily: 'Nunito',
          textTheme: TextTheme(
            body1: TextStyle(fontSize: 18.0),
            body2: TextStyle(fontSize: 20.0),
          ),
          dividerColor: Theme1.mistColor(),
          splashColor: Theme1.honeyColor(),
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: _generatedRoutes,
        routes: _namedRoutes(context),
      ),
    );
    //
  }

  //
  Map<String, Widget Function(BuildContext)> _namedRoutes(BuildContext context) {
    //
    return {
      '/': (ctx) => HomeScreen(),
      '/manage-tags': (ctx) => ManageTagsScreen(),
    };
  }

  Route _generatedRoutes(RouteSettings rs) {
    //
    return MaterialPageRoute(builder: (context) {
      return HomeScreen();
    });
  }

  void _initLogging() {
    //
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord rec) {
      print('${rec.time} [${rec.loggerName}] ${rec.message}');
    });
  }

  @override
  void dispose() {
    //
    actionsListBloc.dispose();
    super.dispose();
    //
  }

  //
}
