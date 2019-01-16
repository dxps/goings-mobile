import 'package:rxdart/rxdart.dart';
import 'package:logging/logging.dart';

import '../resources/ActionsRepo.dart';
import '../models/action_model.dart';

//
class ActionsBloc {
  //

  final _repo = ActionsRepo();
  final _actionsFetcher = PublishSubject<ActionModel>();

  final Logger _log = Logger('ActionsBloc');

  Observable<ActionModel> get allActions => _actionsFetcher.stream;

  //
  fetchAllActions() async {
    //
    List<ActionModel> actions = await _repo.retrieveActions();
    actions.forEach((action) {
      _log.finer('fetchAllActions > Adding action \'${action.name}\' to sink');
      _actionsFetcher.sink.add(action);
    });
  }

  //
  dispose() {
    //
    // _actionsFetcher.close();
    _actionsFetcher.drain();
  }
}

/// the single instance to be used by UI screen(s)
final actionsBloc = ActionsBloc();
