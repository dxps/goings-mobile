import 'package:flutter/material.dart';

import '../themes/theme1.dart';
import '../blocs/bloc_provider.dart';
import '../blocs/actions_bloc.dart';
import '../widgets/actions_list.dart';

//
class HomeScreen extends StatelessWidget {
  //

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      drawer: _buildSideDrawer(context),
    );
  }

  //
  Widget _buildBody(BuildContext context) {
    //
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: () => _refreshActionsList(context),
      child: ActionsList(),
    );
  }

  //
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
          onPressed: () {
            _refreshIndicatorKey.currentState.show();
          },
        )
      ],
    );
  }

  //
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
  }

  //
  Future<Null> _refreshActionsList(BuildContext context) async {
    //
    BlocProvider.of<ActionsBloc>(context).getActions();
    // simulating a delay
    // await new Future.delayed(Duration(seconds: 2));
    return null;
  }

  //
}
