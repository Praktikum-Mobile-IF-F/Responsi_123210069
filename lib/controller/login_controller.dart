import 'package:responsiprakmobile/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController{
  final String _validUsername = 'user';
  final String _validPassword = 'password';

  Future<bool> login(UserModel user) async {
    try {
      print("Login...");
      if (user.username == _validUsername && user.password == _validPassword) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLogedIn', true);
        print("Login sukses");
        return true;
      }
      print("Login gagal");
      return false;
    } catch (e) {
      print("Login error $e");
      return false;
    }
  }
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('IsLoggedIn', false);
  }
}