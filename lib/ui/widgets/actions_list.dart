import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../../models/action_model.dart';
import '../../blocs/actions_bloc.dart';

//
class ActionsList extends StatefulWidget {
  //

  @override
  State<StatefulWidget> createState() {
    return _ActionsListState();
  }
//

}

//
class _ActionsListState extends State<ActionsList> {
  //
  
  final Logger log = new Logger('_ActionsListState');

  @override
  void initState() {
    //
    super.initState();
    actionsBloc.fetchAllActions();
  }
  
  @override
  void dispose() {
    //
    actionsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //
    
    return Column(
      children: <Widget>[
        StreamBuilder(
          stream: actionsBloc.allActions,
          builder: (BuildContext context, AsyncSnapshot<ActionModel> snapshot) {
            if (snapshot.hasData) {
              return _buildList(snapshot);
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error.toString()}');
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ],
    );
  }

  //
  Widget _buildList(AsyncSnapshot<ActionModel> snapshot) {
    //
    log.finest('_buildList > snapshot.data.name = ${snapshot.data.name}');
    // log.finest('_buildList > snapshot.data = ${snapshot.data.toJsonString()}');
    return Text(snapshot.data.name);
  }
}
