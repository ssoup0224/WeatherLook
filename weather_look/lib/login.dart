// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:weather_look/util/anonymous_login.dart';
import 'package:weather_look/util/google_login.dart';
import 'package:weather_look/util/kakao_login.dart';
import 'package:weather_look/util/login_platform.dart';
import 'package:weather_look/util/naver_login.dart';
import 'package:weather_look/widget/login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginPlatform _loginPlatform = LoginPlatform.none;
  final GoogleLogin _googleLogin = GoogleLogin();
  final AnonymousLogin _anonymousLogin = AnonymousLogin();

  void signInWithGoogle() async {
    await _googleLogin.signInWithGoogle(updateLoginPlatform);
  }

  void signInWithKakao() async {
    await KakaoLogin.signInWithKakao(updateLoginPlatform);
  }

  void signInWithNaver() async {
    await NaverLogin.signInWithNaver(updateLoginPlatform);
  }

  void signInAnonymously() async {
    await _anonymousLogin.signInAnonymously(updateLoginPlatform);
  }

  void updateLoginPlatform(LoginPlatform platform) {
    setState(() {
      _loginPlatform = platform;
    });
  }

  void signOut() async {
    switch (_loginPlatform) {
      case LoginPlatform.google:
        await GoogleSignIn().signOut();
        break;
      case LoginPlatform.kakao:
        await UserApi.instance.logout();
        break;
      case LoginPlatform.naver:
        await FlutterNaverLogin.logOut();
        break;
      case LoginPlatform.anonymous:
        await _anonymousLogin.signOut(updateLoginPlatform);
        break;
      case LoginPlatform.none:
        break;
    }

    setState(() {
      _loginPlatform = LoginPlatform.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _usernameController,
            decoration: const InputDecoration(
              filled: true,
              labelText: 'Username',
            ),
          ),
          // spacer
          const SizedBox(height: 12.0),
          // [Password]
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(
              filled: true,
              labelText: 'Password',
            ),
            obscureText: true,
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
              child: _loginPlatform != LoginPlatform.none
                  ? _logoutButton()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _loginButton(
                          'google_logo',
                          signInWithGoogle,
                        ),
                        _loginButton(
                          'kakao_logo',
                          signInWithKakao,
                        ),
                        _loginButton(
                          'naver_logo',
                          signInWithNaver,
                        ),
                        _loginButton(
                          'anonymous_logo',
                          signInAnonymously,
                        ),
                      ],
                    )),
        ],
      ),
    );
  }

  Widget _loginButton(String path, VoidCallback onTap) {
    return LoginButton(
      path: path,
      onTap: onTap,
    );
  }

  Widget _logoutButton() {
    return ElevatedButton(
      onPressed: signOut,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(0xff0165E1),
        ),
      ),
      child: const Text('로그아웃'),
    );
  }
}
