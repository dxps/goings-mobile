import 'package:equatable/equatable.dart';

import '../models/action_model.dart';

///
abstract class ActionsListState extends Equatable {}

///
class ActionsListStateInitially extends ActionsListState {

  @override
  String toString() => 'ActionsListStateInitially';

  //
}

///
class ActionsListStateLoading extends ActionsListState {

  @override
  String toString() => 'ActionsListStateLoading';

  //
}

///
class ActionsListStateLoaded extends ActionsListState {

  final List<ActionModel> actions;

  ActionsListStateLoaded(this.actions);

  @override
  String toString() => 'ActionsListStateLoaded';

  //
}
