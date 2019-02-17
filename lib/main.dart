import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:bloc/bloc.dart';

import 'src/app.dart';

//
void main() {
  //

  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(
    App(),
  );
  
  //
}

class SimpleBlocDelegate extends BlocDelegate {
  //

  static final Logger _log = Logger('SimpleBlocDelegate');

  @override
  void onTransition(Transition transition) {
    _log.fine('onTransition > ${transition.toString()}');
  }

  //
}
