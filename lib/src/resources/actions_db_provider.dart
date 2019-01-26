import 'dart:async';
import 'dart:io';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'actions_repo.dart';

//
class ActionsDbProvider implements ActionsDataSource {
  //
  Database _db;

  final Logger _log = Logger('ActionsDbProvider');

  ActionsDbProvider() {
    init();
  }

  //
  void init() async {
    //
    Directory docsDir = await getApplicationDocumentsDirectory();
    final path = join(docsDir.path, "goings.db");
    _log.fine('Opening db file $path ');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        newDb.execute("""
          CREATE TABLE actions (
            id           INTEGER PRIMARY KEY,
            name         TEXT,
            description  TEXT,
            tags         TEXT
          )
        """);
      },
    );
  }

  @override
  Future<List<ActionModel>> fetchActions() async {
    //
    List<ActionModel> actions = [];
    final rs = await _db.query('actions');
    for (var r in rs) {
      actions.add(ActionModel.fromDb(r));
    }
    _log.finer('fetchActions > ${actions.length} rows.');
    return actions;
  }

  //
}
