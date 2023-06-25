import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';
import 'package:weather_look/util/chatGpt.dart';

class TextToSpeech extends StatefulWidget {
  const TextToSpeech({super.key});

  @override
  State<TextToSpeech> createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  final _blackColor = const Color(0xFF1F2123);

  late Future<String> generatedTextFuture;
  late String generatedText = '';

  final FlutterTts tts = FlutterTts();

  double currentvol = 0.7;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      currentvol = await PerfectVolumeControl.getVolume();
      //get current volume

      setState(() {
        //refresh UI
      });
    });

    PerfectVolumeControl.stream.listen((volume) {
      //volume button is pressed,
      // this listener will be triggeret 3 times at one button press

      if (volume != currentvol) {
        //only execute button type check once time
        if (volume > currentvol) {
          //if new volume is greater, then it up button
          tts.stop();
        } else {
          //else it is down button
          tts.stop();
        }
      }

      setState(() {
        currentvol = volume;
      });
    });

    super.initState();
    // 언어 설정
    tts.setLanguage("ko-KR");
    // 속도지정 (0.0이 제일 느리고 1.0이 제일 빠름)
    tts.setSpeechRate(0.5);

    getChatGpt();
  }

  Future<String> generateText() {
    String prompt =
        "오늘은 온도는 26도이고, 습도는 높은 편이고, 일교차가 15도 정도 차이가 나. 어떤 옷 코디를 하면 좋을 지 친근한 말투로 알려줄래?";
    ChatGpt chatGpt = ChatGpt();
    return chatGpt.generateText(prompt);
  }

  void getChatGpt() {
    generatedTextFuture = generateText();
    generatedTextFuture.then((data) {
      setState(() {
        generatedText = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text to Speech"),
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: getChatGpt,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      // Expanded 위젯 추가
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Weather AI',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Divider(),
                          FutureBuilder<String>(
                            future: generatedTextFuture,
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return Text(
                                  snapshot.data ?? '',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 11,
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => tts.speak(generatedText),
                  child: const Text("Start"),
                ),
                TextButton(
                  onPressed: () => tts.stop(),
                  child: const Text("Stop"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
