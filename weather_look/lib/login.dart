import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../util/auth.dart';
import '../util/google_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter email and password.'),
        ),
      );
      return;
    }

    User? user = await Authentication.signUpWithEmail(
      context: context,
      email: email,
      password: password,
    );

    if (user != null) {
      // Registration successful, navigate to next screen
      Navigator.pushNamed(context, '/navigation');
    }
  }

  Future<void> _signIn() async {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter email and password.'),
        ),
      );
      return;
    }

    User? user = await Authentication.signInWithEmail(
      context: context,
      email: email,
      password: password,
    );

    if (user != null) {
      // Login successful, navigate to next screen
      Navigator.pushNamed(context, '/navigation');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: (MediaQuery.of(context).size.height) / 6.4,
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(
                'asset/image/weatherlook_logo.png',
              ),
            ),
            const SizedBox(height: 100),
            SizedBox(
              width: 270,
              height: 44,
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 18),
                  filled: true,
                  fillColor: const Color(0xffE1ECF7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  hintText: '이메일',
                  hintStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 13),
            SizedBox(
              width: 270,
              height: 44,
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 18),
                  filled: true,
                  fillColor: const Color(0xffE1ECF7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  hintText: '비밀번호',
                  hintStyle: const TextStyle(fontSize: 16),
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 26),
            TextButton(
              onPressed: () {},
              child: const Text(
                '아이디/비밀번호 찾기 >',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff797979),
                ),
              ),
            ),
            const SizedBox(height: 37),
            SizedBox(
              width: 100,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF86B6E1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: _signIn,
                child: const Text(
                  '로그인',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: const Text(
                '회원가입',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff797979),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 33),
            FutureBuilder(
              future: Authentication.initializeFirebase(context: context),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Error initializing Firebase');
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return const GoogleSignInButton();
                }
                return const CircularProgressIndicator(
                  color: Color(0xffff0c4c8a),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
