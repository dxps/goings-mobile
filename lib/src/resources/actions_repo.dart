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
    // Static list for testing.
    // return [
    //   ActionModel('Home to Office', tags: ['commute']),
    //   ActionModel('Office to Home', tags: ['commute']),
    // ];
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
