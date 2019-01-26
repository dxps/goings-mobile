import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import '../blocs/bloc_provider.dart';
import '../blocs/actions_bloc.dart';
import '../models/action_model.dart';

//
class ActionsList extends StatelessWidget {
  //

  final Logger _log = Logger('ActionsList');

  @override
  Widget build(BuildContext context) {
    //
    var actionsBloc = BlocProvider.of<ActionsBloc>(context);
    return StreamBuilder<List<ActionModel>>(
      stream: actionsBloc.actionsStream,
      builder: (BuildContext context, AsyncSnapshot<List<ActionModel>> snapshot) {
        if (snapshot.hasData) {
          return _buildBody(snapshot.data);
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildBody(List<ActionModel> actions) {
    //
    _log.finer('_buildBody > ${actions.length} actions provided.');
    if (actions.length == 0) {
      return Center(child: Text('No actions exist', style: TextStyle(fontStyle: FontStyle.italic)));
    }
    return Center(
      child: ListView.builder(
        itemCount: actions.length,
        itemBuilder: (context, idx) => Text('${actions[idx].name}'),
      ),
    );
  }

  //
}
