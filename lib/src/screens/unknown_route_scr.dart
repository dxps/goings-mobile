import 'package:flutter/material.dart';

///
///
///
class UnknownRouteScreen extends StatelessWidget {
  //

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Oops!'),
            Text('Unknown path.'),
            IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
          ],
        ),
      ),
    );
  }

  //
}
