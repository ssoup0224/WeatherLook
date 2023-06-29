import 'package:flutter/material.dart';

class GenderSelectPage extends StatelessWidget {
  const GenderSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: const Color(0xff538FC5),
        title: const Text(
          '프로필 설정',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '성별',
              style: TextStyle(
                color: Color(0xff538FC5),
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 124,
              height: 39,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE1ECF7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  '남',
                  style: TextStyle(
                    color: Color(0xff538FC5),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 124,
              height: 39,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE1ECF7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  '여',
                  style: TextStyle(
                    color: Color(0xff538FC5),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 260,
            ),
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
                onPressed: () {
                  Navigator.pushNamed(context, '/style');
                },
                child: const Text(
                  '완료',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
