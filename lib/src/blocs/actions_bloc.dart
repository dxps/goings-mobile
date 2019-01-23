import 'package:rxdart/rxdart.dart';
import 'package:logging/logging.dart';

import 'bloc_provider.dart';
import '../resources/ActionsRepo.dart';
import '../models/action_model.dart';

//
class ActionsBloc implements BlocBase {
  //

  final _repo = ActionsRepo();

  // actions fetcher (controller) and its stream exposed
  final _actionsFetcher = PublishSubject<ActionModel>();
  Observable<ActionModel> get allActions => _actionsFetcher.stream;

  final _cmdCtrl = PublishSubject();
  void Function(dynamic) get getActions => _cmdCtrl.sink.add;

  final Logger _log = Logger('ActionsBloc');

  ActionsBloc() {
    _cmdCtrl.stream.listen((_) => fetchAllActions());
  }

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
    _actionsFetcher.close();
  }
}
