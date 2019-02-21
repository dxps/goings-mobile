import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import './actions_list_bloc.dart';

///
///
///
class ActionsListWidget extends StatelessWidget {
  //

  static final Logger _log = Logger('ActionsListWidget');

  final List<ActionModel> actions;

  const ActionsListWidget({Key key, this.actions}) : super(key: key);

  //
  @override
  Widget build(BuildContext context) {
    //
    _log.finer('build > actions:$actions');
    return _buildList(actions);
    //
  }

  ///
  Widget _buildList(List<ActionModel> actions) {
    //
    if (actions.length == 0) {
      return Center(child: Text('No action exists.', style: TextStyle(fontStyle: FontStyle.italic)));
    }
    return Center(
      child: ListView.builder(
        itemCount: actions.length,
        itemBuilder: (context, idx) => Text('${actions[idx].name}'),
      ),
    );
    //
  }

  //
}
