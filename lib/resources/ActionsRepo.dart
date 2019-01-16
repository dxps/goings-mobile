import 'dart:async';
import 'dart:io';
import '../models/action_model.dart';

//
class ActionsRepo {
  //

  Future<List<ActionModel>> retrieveActions() async {
    //
    // simulating a long time processing
    sleep(Duration(seconds: 4));
    return [
      ActionModel('Home to Office', tags: ['commute']),
      ActionModel('Office to Home', tags: ['commute']),
    ];
  }
}
