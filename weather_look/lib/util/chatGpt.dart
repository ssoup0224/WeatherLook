import 'dart:convert';
import 'package:http/http.dart' as http;

const apiKey = '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';
const apiUrl = 'https://api.openai.com/v1/completions';

class ChatGpt {
  Future<String> generateText(String prompt) async {
    String prompt2 = prompt;
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey'
      },
      body: jsonEncode({
        "model": "text-davinci-003",
        'prompt': prompt2,
        'max_tokens': 1000,
        'temperature': 0,
        'top_p': 1,
        'frequency_penalty': 0,
        'presence_penalty': 0
      }),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> newresponse =
          jsonDecode(utf8.decode(response.bodyBytes));
      return newresponse['choices'][0]['text'];
    } else {
      throw Exception('Failed to get chat response');
    }
  }
}
