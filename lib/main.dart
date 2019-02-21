import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:bloc/bloc.dart';

import 'src/app.dart';

///
///   STARTUP
///
void main() {
  //

  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(
    App(),
  );

  //
}

///
///
///
class SimpleBlocDelegate extends BlocDelegate {
  //

  static final Logger _log = Logger('SimpleBlocDelegate');

  @override
  void onTransition(Transition transition) {
    // This is a great place to add bloc-specific logging/analytics.
    //_log.fine('onTransition > ${transition.toString()}');
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    _log.fine('onError > ${error.toString()}');
  }

  //
}
