import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './actions_list_bloc.dart';

///
///
///
class ActionsListWidget extends StatelessWidget {
  //

  static final Logger _log = Logger('ActionsListWidget');

  //
  @override
  Widget build(BuildContext context) {
    //
    ActionsListBloc actionsListBloc = BlocProvider.of<ActionsListBloc>(context);
    _log.finer('build > Found ActionsListBloc #${actionsListBloc.hashCode}');
    return BlocBuilder<ActionsListEvent, ActionsListState>(
      bloc: actionsListBloc,
      builder: (BuildContext context, ActionsListState state) {
        _log.fine('build > state:${state.toString()}');
        if (state is ActionsListStateInitially) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Center(child: Text('Initial state', style: TextStyle(fontStyle: FontStyle.italic))),
          );
        }
        if (state is ActionsListStateLoaded) {
          return _buildList(state.actions);
        }
      },
    );
    //
  }

  ///
  Widget _buildList(List<ActionModel> actions) {
    //
    //_log.finer('_buildList > ${actions.length} actions received.');
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
