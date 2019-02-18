import 'package:equatable/equatable.dart';

///
class ActionsListEvent extends Equatable {}

///
/// The event telling that ActionsList is loading.
///
class ActionsListLoadingEvent extends ActionsListEvent {
  //

  @override
  String toString() => 'ActionsListLoadingEvent';

  //
}
