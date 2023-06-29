import 'package:flutter/material.dart';

class StyleSelectPage extends StatelessWidget {
  const StyleSelectPage({super.key});

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
              height: 36,
            ),
            Container(
              width: 270,
              height: 270,
              decoration: const BoxDecoration(),
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                children: const [],
              ),
            ),
            const SizedBox(
              height: 115,
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
                  Navigator.pushNamed(context, '/tts');
                },
                child: const Text(
                  '다음',
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
