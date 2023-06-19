import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:weather_look/util/login_platform.dart';

class KakaoLogin {
  static Future<void> signInWithKakao(
      Function(LoginPlatform) updateLoginPlatform) async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();

      OAuthToken token = isInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();

      final url = Uri.https('kapi.kakao.com', '/v2/user/me');

      final response = await http.get(
        url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${token.accessToken}'
        },
      );

      final profileInfo = json.decode(response.body);
      print(profileInfo.toString());

      updateLoginPlatform(LoginPlatform.kakao);
    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');
    }
  }
}
