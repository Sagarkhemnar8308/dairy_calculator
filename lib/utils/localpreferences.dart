import 'package:shared_preferences/shared_preferences.dart';

class LocaleStorage {
  static late final SharedPreferences instance;

  static Future<void> init() async {
    instance = await SharedPreferences.getInstance();
  }

  static Future<void> saveUserID(String userID) async {
    await instance.setString("userID", userID);
  }

  static Future<void> savePin(String pin) async {
    await instance.setString("pin", pin);
  }

  static Future<void> saveProfile(
      String name, String surname, String village, String pincode) async {
    await instance.setString("name", name);
    await instance.setString("surname", surname);
    await instance.setString("village", village);
    await instance.setString("pincode", pincode);
  }

  static Future<Map<String, String?>> getProfile() async {
    final SharedPreferences prefs = instance;
    final String? name = prefs.getString('name');
    final String? surname = prefs.getString('surname');
    final String? village = prefs.getString('village');
    final String? pincode = prefs.getString('pincode');

    return {
      'name': name,
      'surname': surname,
      'village': village,
      'pincode': pincode,
    };
  }
}
