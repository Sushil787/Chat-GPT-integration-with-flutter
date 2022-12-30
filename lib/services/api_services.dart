import 'dart:convert';
import 'package:app_gpt/constants/constants.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  generateText(String prompt) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };
    var data = jsonEncode(
        {"model": "text-davinci-002", "prompt": prompt, "max_tokens": 4000});
    var res = await http.post(url, headers: headers, body: data);
    return res.body;
  }

  fetchData(String query) async {
    var response = await generateText(query);
    var answerData = jsonDecode(response);
    return answerData['choices'][0]['text'];
  }
}
