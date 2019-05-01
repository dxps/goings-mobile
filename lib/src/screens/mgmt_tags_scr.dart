import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../themes/theme1.dart';

//
class ManageTagsScreen extends StatelessWidget {
  //

  static final Logger _log = Logger('ManageTagsScreen');

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Tags'),
        backgroundColor: Theme1.morningSkyColor(),
        elevation: 0.0,
        // automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){
            // TODO: see https://medium.com/flutterpub/a-simple-search-bar-in-flutter-f99aed68f523
          },)
        ],
      ),
      body: _buildBody(),
    );
  }

  //
  Widget _buildBody() {
    //
    _log.fine('_buildBody > started.');
    return Column(children: <Widget>[

    ],);
  }

  //
}
