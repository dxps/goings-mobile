import 'dart:async';
import '../models/action_model.dart';
import './actions_db_provider.dart';

// Any component that uses this repo must need to know the model.
// Exporting it saves us from importing that model also.
export '../models/action_model.dart';

//
class ActionsRepo {
  //
  final ActionsDataSource dataSource = new ActionsDbProvider();

  Future<List<ActionModel>> retrieveActions() async {
    //
    return dataSource.fetchActions();
  }

  //
}

//
abstract class ActionsDataSource {
  //

  Future<List<ActionModel>> fetchActions();

  //
}
