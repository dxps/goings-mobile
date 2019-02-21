import 'package:equatable/equatable.dart';

import '../action_model.dart';

///
abstract class ActionsListState extends Equatable {}

///
class ActionsListStateInitial extends ActionsListState {

  @override
  String toString() => 'ActionsListStateInitial';

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
