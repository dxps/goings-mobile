import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../themes/theme1.dart';
import '../actions/actions_list_bloc.dart';
import '../actions/actions_list_event.dart';
import '../actions/actions_list_wdg.dart';

///
/// The home screen.
///
class HomeScreen extends StatelessWidget {
  //

  // final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      drawer: _buildSideDrawer(context),
    );
  }

  /// Building the Scaffold's body.
  Widget _buildBody(BuildContext context) {
    //
    return ActionsListWidget();
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
              return Navigator.pushNamed(context, '/manage-tags');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.fastfood),
            title: Text('Something TBD'),
            onTap: () {
              Navigator.of(context).pop(); // close the side drawer
              return Navigator.pushNamed(context, '/manage-tbd');
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
