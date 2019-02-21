import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './actions/list/actions_list_bloc.dart';
import './themes/theme1.dart';
import './screens/home_scr.dart';
import './screens/mgmt_tags_scr.dart';
import './screens/unknown_route_scr.dart';

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

  HomeScreen homeScreen;
  ManageTagsScreen manageTagsScreen;

  AppState() {
    _initLogging();
    this.actionsListBloc = ActionsListBloc();
    _log.finer('build > Created ActionsListBloc #${actionsListBloc.hashCode}');
    this.homeScreen = HomeScreen();
    this.manageTagsScreen = ManageTagsScreen();
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
        routes: _namedRoutes(context),
        onUnknownRoute: _unknownRoute,
      ),
    );
    //
  }

  //
  Map<String, Widget Function(BuildContext)> _namedRoutes(BuildContext context) {
    //
    return {
      '/': (ctx) => homeScreen,
      '/manage-tags': (ctx) => manageTagsScreen,
    };
  }

  //
  Route _unknownRoute(RouteSettings rs) {
    //
    return MaterialPageRoute(builder: (context) {
      _log.finer('_unknownRoute > name: ${rs.name}');
      return UnknownRouteScreen();
    });
    //
  }

  //
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
