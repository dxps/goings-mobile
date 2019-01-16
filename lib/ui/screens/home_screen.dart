import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../widgets/actions_list.dart';

//
class HomeScreen extends StatelessWidget {
  //

  final String title;

  final GlobalKey<RefreshIndicatorState> _refreshKey = new GlobalKey<RefreshIndicatorState>();

  final Logger log = Logger('HomeScreen');

  HomeScreen({this.title});

  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      //
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: 'Refresh',
              onPressed: () {
                _refreshKey.currentState.show();
              }),
        ],
      ),
      //
      body: Center(
        child: RefreshIndicator(
          key: _refreshKey,
          onRefresh: () async {
            log.finer('onRefresh > Called');
          },
          child: ActionsList(),
        ),
      ),
    );
  }
}
