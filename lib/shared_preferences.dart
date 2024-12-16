import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('username', 'Benedict');
}

Future<String> getData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('username') ?? '';
}

Future<void> removeData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('username');
}

Future<void> clearAllData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}
