import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

import '../themes/theme1.dart';
import '../actions/list/actions_list.dart';

///
/// The home screen.
///
class HomeScreen extends StatelessWidget {
  //

  static final Logger _log = Logger('HomeScreen');

  // final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    //
    _log.finer('build > started');
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      drawer: _buildSideDrawer(context),
    );
  }

  /// Building the Scaffold's body.
  Widget _buildBody(BuildContext context) {
    //
    ActionsListBloc actionsListBloc = BlocProvider.of<ActionsListBloc>(context);
    return BlocBuilder<ActionsListEvent, ActionsListState>(
      bloc: actionsListBloc,
      builder: (BuildContext context, ActionsListState state) {
        _log.fine('_buildBody > blocbuilder > state:${state.toString()}');
        if (state is ActionsListStateInitial) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Center(child: Text('Initial state', style: TextStyle(fontStyle: FontStyle.italic))),
          );
        }
        if (state is ActionsListStateLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is ActionsListStateLoaded) {
          return ActionsListWidget(actions: state.actions);
        }
      },
    );
    //
  }

  /// Building the AppBar.
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    //
    return AppBar(
      title: Text('Goings'),
      centerTitle: true,
      backgroundColor: Theme1.morningSkyColor(),
      elevation: 0.0,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () => _refreshActionsList(context),
        )
      ],
    );
    //
  }

  /// Build the side Drawer.
  Drawer _buildSideDrawer(BuildContext context) {
    //
    return Drawer(
      child: ListView(
        children: <Widget>[
          AppBar(
            title: Text('Manage'),
            centerTitle: true,
            backgroundColor: Theme1.honeyColor(),
            elevation: 0.0,
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Tags'),
            onTap: () {
              Navigator.of(context).pop(); // close the side drawer
              Navigator.pushNamed(context, '/manage-tags');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.fastfood),
            title: Text('TBD'),
            onTap: () {
              Navigator.of(context).pop(); // close the side drawer
              Navigator.pushNamed(context, '/manage-tbd');
            },
          ),
        ],
      ),
    );
    //
  }

  //
  Future<void> _refreshActionsList(BuildContext context) async {
    //
    BlocProvider.of<ActionsListBloc>(context).dispatch(ActionsListLoadingEvent());
    //
  }

  //
}
