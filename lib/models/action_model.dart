import 'dart:convert';

//
class ActionModel {
  //

  /// Name of the action.
  String _name;

  /// (Optional) Description of the action.
  String _description;

  /// (Optional List of) Tags of the action.
  List<String> _tags;

  //
  ActionModel(String name, {String description: '', List<String> tags}) {
    //
    this._name = name;
    this._description = description;
    this._tags = tags;
  }

  String get name => _name;

  String get description => _description;

  List<String> get tags => _tags;
  
  /// Get the String version in JSON format.
  String toJsonString() {
    return json.encode(this);
  }
}
