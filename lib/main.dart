import 'package:flutter/material.dart';

import 'src/blocs/bloc_provider.dart';
import 'src/blocs/actions_bloc.dart';
import 'src/app.dart';

//
void main() {
  //

  runApp(
    BlocProvider<ActionsBloc>(
      bloc: ActionsBloc(),
      child: App(),
    ),
  );

  //
}
