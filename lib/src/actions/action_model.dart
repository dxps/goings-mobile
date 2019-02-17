import 'dart:convert';
import 'package:uuid/uuid.dart';

///
/// The model of an Action.
///
class ActionModel {
  //

  /// Name of the action.
  String _id;

  /// Name of the action.
  String _name;

  /// (Optional) Description of the action.
  String _description;

  /// (Optional List of) Tags of the action.
  List<String> _tags;

  /// State of the action.
  String _state;

  //
  ActionModel(String name, {String description: '', List<String> tags,
      state: 'O'}) {
    //
    this._id = Uuid().v1();
    this._name = name;
    this._description = description;
    this._tags = tags ?? [];
    this._state = state;
  }

  //
  ActionModel.fromDb(Map<String,dynamic> row) {
    //
    this._id = row['id'];
    this._name = row['name'];
    this._description = row['description'];
    this._tags = jsonDecode(row['tags']);
    this._state = jsonDecode(row['state']);
  }

  //
  Map<String,dynamic> toMapForDb() {
    //
    return <String, dynamic> {
      "id": _id,
      "name": _name,
      "description": _description,
      "tags": jsonEncode(tags),
      "state": _state
    };
  }

  String get id => _id;

  String get name => _name;

  String get description => _description;

  List<String> get tags => _tags;

  String get state => _state;

  /// Get the String version of this action instance in JSON format.
  String toJsonString() {
    return json.encode(this);
  }

  //
}
