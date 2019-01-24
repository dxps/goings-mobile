import 'package:flutter/widgets.dart';

/// BlocBase is a contract used for enforcing the bloc
/// components to implement the dispose() method.
abstract class BlocBase {
  void dispose();
}

/// BlocProvider is a generic, reusable, and healthy approach
/// (it frees memory through dispose() of StatefulWidget)
/// for implementing a bloc provider as an ancestor component.
class BlocProvider<T extends BlocBase> extends StatefulWidget {
  //

  final T bloc;
  final Widget child;

  BlocProvider({Key key, @required this.bloc, @required this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BlocProviderState<T>();
  }

  static Type _typeOf<T>() => T;

  /// Returning the BLoC of the provided parameterized type.
  static T of<T extends BlocBase>(BuildContext context) {
    final type = _typeOf<BlocProvider<T>>();
    BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    //debugPrint('[BlocProvider] .of(_) > returning bloc for type: ${type.runtimeType}');
    return provider.bloc;
  }

  //
}

/// The state of BlocProvider.
class _BlocProviderState<T> extends State<BlocProvider<BlocBase>> {
  //

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  //
}
