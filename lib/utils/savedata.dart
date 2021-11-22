import 'package:shared_preferences/shared_preferences.dart';

class SaveData {
  static SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static saveStringData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static saveIntData(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  static saveBoolData(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static saveDoubleData(String key, double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  static getString(String key) async {
    init();
    String stringValue = _preferences.getString(key) ?? '-';
    return stringValue;
  }

  static getInt(String key) async {
    int intValue = _preferences.getInt(key) ?? 0;
    return intValue;
  }

  static getBool(String key) async {
    bool boolValue = _preferences.getBool(key) ?? false;
    return boolValue;
  }

  static getDouble(String key) async {
    double doubleValue = _preferences.getDouble(key) ?? 0;
    return doubleValue;
  }

  static deleteData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static void saveFirstData(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String fName = data.split(" ")[0];
    prefs.setString("first_name", fName);
  }

  static void saveLastData(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String lName = data.split(" ")[1];
    prefs.setString("last_name", lName);
  }
}
