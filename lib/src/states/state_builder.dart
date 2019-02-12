import 'package:flutter/widgets.dart';
import './state_model.dart';

///
/// `StateBuilder` is used for register to one or more states
/// (declared in `usingStates`) that are used by the wrapped widget(s)
/// which are rendered through the declared `builder` function.
///
class StateBuilder extends StatefulWidget {
  //

  /// `builder` function returns the `Widget` that uses the state(s)
  /// which are declared in `usingStates`.
  @required
  final Widget Function(State state) builder;

  final void Function(State state) initState, dispose, didChangeDependencies;

  final void Function(StateBuilder oldWidget, State state) didUpdateWidget;

  /// The state id of this component, used for subscribing itself
  /// to get notified on updates happen on the  states declared in `usingStates`.
  final String stateId;

  /// The list of states whose changes should notify this component.
  final List<StateModel> usingStates;

  const StateBuilder(
      {Key key,
      this.stateId,
      this.builder,
      this.initState,
      this.dispose,
      this.didChangeDependencies,
      this.didUpdateWidget,
      this.usingStates})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateBuilderState();

  //
}

///
class _StateBuilderState extends State<StateBuilder> {
  //

  @override
  void initState() {
    //
    super.initState();
    if (widget.stateId != null && widget.stateId != "") {
      if (widget.usingStates != null) {
        widget.usingStates.forEach(
          (s) {
            if (s == null) return;
            s.subscribe(widget.stateId, this);
          },
        );
      }
    }
    if (widget.initState != null) widget.initState(this);
    //
  }

  @override
  void dispose() {
    //
    if (widget.stateId != null && widget.stateId != "") {
      if (widget.usingStates != null) {
        widget.usingStates.forEach(
          (sn) {
            if (sn == null) return;
            sn.unsubscribe(widget.stateId, hashCode);
          },
        );
      }
    }
    if (widget.dispose != null) widget.dispose(this);
    super.dispose();
    //
  }

  @override
  void didChangeDependencies() {
    //
    super.didChangeDependencies();
    if (widget.didChangeDependencies != null) widget.didChangeDependencies(this);
    //
  }

  @override
  void didUpdateWidget(StateBuilder oldWidget) {
    //
    super.didUpdateWidget(oldWidget);
    if (widget.didUpdateWidget != null) widget.didUpdateWidget(oldWidget, this);
    //
  }

  @override
  Widget build(BuildContext context) {
    //
    return widget.builder(this);
  }

  //
}
