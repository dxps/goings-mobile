import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';

import './actions_list_event.dart';
export './actions_list_event.dart';

import './actions_list_state.dart';
export './actions_list_state.dart';

import '../actions_repo.dart';

import '../action_model.dart';
export '../action_model.dart';

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

    _log.finer('Handling event ${event.toString()}');
    if (event is ActionsListLoadingEvent) {
      List<ActionModel> actions = await _actionsRepo.retrieveActions();
      _log.finer('Retrieved ${actions.length} actions.');
      yield ActionsListStateLoaded(actions);
    }

    //
  }

  //
}
