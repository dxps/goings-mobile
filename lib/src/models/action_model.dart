import 'dart:convert';
import 'package:uuid/uuid.dart';

//
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

  //
  ActionModel(String name, {String description: '', List<String> tags}) {
    //
    this._id = Uuid().v1();
    this._name = name;
    this._description = description;
    this._tags = tags;
  }

  //
  ActionModel.fromDb(Map<String,dynamic> row) {
    //
    this._id = row['id'];
    this._name = row['name'];
    this._description = row['description'];
    this._tags = jsonDecode(row['tags']);
  }

  //
  Map<String,dynamic> toMapForDb() {
    //
    return <String, dynamic> {
      "id": _id,
      "name": _name,
      "description": _description,
      "tags": jsonEncode(tags)
    };
  }

  String get id => _id;

  String get name => _name;

  String get description => _description;

  List<String> get tags => _tags;

  /// Get the String version of this action instance in JSON format.
  String toJsonString() {
    return json.encode(this);
  }

  //
}
