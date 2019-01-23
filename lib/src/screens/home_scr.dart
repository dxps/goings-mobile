import 'package:flutter/material.dart';

import '../themes/theme1.dart';
import '../blocs/bloc_provider.dart';
import '../blocs/actions_bloc.dart';

//
class HomeScreen extends StatelessWidget {
  //

  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      drawer: _buildSideDrawer(context),
    );
  }

  Widget _buildBody() {
    return Center(
        child: Text('Home Screen', ),
      );
  }

  PreferredSizeWidget _buildAppBar() {
    //
    return AppBar(
      title: Text('Goings'),
      centerTitle: true,
      backgroundColor: Theme1.morningSkyColor(),
      elevation: 0.0,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            print('[HomeScreen] add ...');
            // TODO: use ActionBloc
          },
        )
      ],
    );
  }

  _buildSideDrawer(BuildContext context) {
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
}
