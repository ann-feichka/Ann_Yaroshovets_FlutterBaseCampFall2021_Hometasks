import 'package:shared_preferences/shared_preferences.dart';
class SharedPreferencesStorage{
  static SharedPreferences storage ;

  static Future init() async {
    storage = await SharedPreferences.getInstance();
  }

  static Future setData(String key,String value) async => storage.setString(key, value);

  static Future<String> getData(String key) async {
    await init();
    String data = storage.getString(key);
    return data;
  }

  static Future deleteData(String key) async {
    await init();
    storage.remove(key);
  }

  static Future setBool(String key,bool value) async => storage.setBool(key, value);

}

