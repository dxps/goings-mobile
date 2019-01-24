import 'dart:async';
import '../models/action_model.dart';

//
class ActionsRepo {
  //

  Future<List<ActionModel>> retrieveActions() async {
    //
    return [
      ActionModel('Home to Office', tags: ['commute']),
      ActionModel('Office to Home', tags: ['commute']),
    ];
  }

  //
}
