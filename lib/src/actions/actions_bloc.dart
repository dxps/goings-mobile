import 'package:rxdart/rxdart.dart';
import 'package:logging/logging.dart';

import '../blocs/bloc_provider.dart';
export '../blocs/bloc_provider.dart';

import '../actions/actions_repo.dart';

import '../models/action_model.dart';
export '../models/action_model.dart';

///
class ActionsBloc implements BlocBase {
  //

  final _repo = ActionsRepo();

  // actions fetcher (controller) and its stream exposed
  final _actionsFetcher = PublishSubject<List<ActionModel>>();
  Observable<List<ActionModel>> get actionsStream => _actionsFetcher.stream;

  final _cmdCtrl = PublishSubject();
  void Function() get getActions => () => _cmdCtrl.sink.add(null);

  final Logger _log = Logger('ActionsBloc');

  ActionsBloc() {
    _cmdCtrl.stream.listen((_) => _fetchAllActions());
  }

  //
  _fetchAllActions() async {
    //
    List<ActionModel> actions = await _repo.retrieveActions();
    _log.finer('_fetchAllActions > Got ${actions.length} actions from repo.');
    _actionsFetcher.sink.add(actions);
  }

  //
  dispose() {
    //
    _cmdCtrl.close();
    _actionsFetcher.close();
  }

  //
}
