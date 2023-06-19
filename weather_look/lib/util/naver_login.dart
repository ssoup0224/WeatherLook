import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:weather_look/util/login_platform.dart';

class NaverLogin {
  static Future<void> signInWithNaver(
      Function(LoginPlatform) updateLoginPlatform) async {
    final NaverLoginResult result = await FlutterNaverLogin.logIn();

    if (result.status == NaverLoginStatus.loggedIn) {
      print('accessToken = ${result.accessToken}');
      print('id = ${result.account.id}');
      print('email = ${result.account.email}');
      print('name = ${result.account.name}');

      updateLoginPlatform(LoginPlatform.naver);
    }
  }
}
