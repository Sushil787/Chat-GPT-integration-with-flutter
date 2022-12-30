import 'package:app_gpt/services/api_services.dart';
import 'package:flutter/widgets.dart';

class GptDataProvider extends ChangeNotifier {
  final _answerQuestionList = {
    "Hello there": "How can i help you?",
  };
  Map get getAnswerQuestionList => _answerQuestionList;

  final ApiServices _apiServices = ApiServices();
  bool isLoading = true;

  fetchAnswer(String query) async {
    toggleLoading();
    final answer = await _apiServices.fetchData(query);
    _answerQuestionList.addAll({query: answer});
    toggleLoading();
    notifyListeners();
  }

  toggleLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
