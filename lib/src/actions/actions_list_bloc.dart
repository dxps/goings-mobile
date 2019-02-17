import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';

import './actions_list_event.dart';
export './actions_list_event.dart';

import './actions_list_state.dart';
export './actions_list_state.dart';

import '../actions/actions_repo.dart';

import '../models/action_model.dart';
export '../models/action_model.dart';

///
/// The BLoC of ActionsList.
///
class ActionsListBloc extends Bloc<ActionsListEvent, ActionsListState> {
  //

  final ActionsRepo _actionsRepo = ActionsRepo();

  static final Logger _log = Logger('ActionsListBloc');

  //
  @override
  ActionsListState get initialState => ActionsListStateInitially();

  //
  @override
  Stream<ActionsListState> mapEventToState(ActionsListState currentState, ActionsListEvent event) async* {
    //

    if (event is ActionsListLoadingEvent) {
      _log.finer('Handling event ${event.toString()}');
      List<ActionModel> actions = await _actionsRepo.retrieveActions();
      _log.finer('_fetchAllActions > Got ${actions.length} actions from repo.');
      yield ActionsListStateLoaded(actions);
    }

    //
  }

  //
}
