import 'package:app_gpt/providers/gpt_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _questionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter ChatGPT'),
          centerTitle: true,
        ),
        body: Consumer<GptDataProvider>(
          builder: (context, value, child) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: value.getAnswerQuestionList.length,
                    itemBuilder: (context, index) {
                      if (value.getAnswerQuestionList.isEmpty) {
                        return SizedBox(
                          height: height * 0.3,
                          child: const Card(
                              child: Text(
                            "How can i help you",
                            style: TextStyle(color: Colors.white),
                          )),
                        );
                      } else {
                        return Card(
                          elevation: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: Column(
                              children: [
                                Text(
                                  value.getAnswerQuestionList.entries
                                      .elementAt(index)
                                      .key
                                      .toString(),
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color.fromARGB(255, 199, 195, 195)),
                                ),
                                Text(value.getAnswerQuestionList.entries
                                    .elementAt(index)
                                    .value
                                    .toString())
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: width * 0.9,
                  child: TextField(
                    enabled:
                        Provider.of<GptDataProvider>(context, listen: false)
                            .isLoading,
                    controller: _questionController,
                    autofocus: true,
                    style: const TextStyle(color: Colors.white70),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your ",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            if (_questionController.text.isNotEmpty) {
                              _questionController.text.trim();
                              Provider.of<GptDataProvider>(context,
                                      listen: false)
                                  .fetchAnswer(_questionController.text);
                              _questionController.clear();
                            }
                          },
                          child: const Icon(Icons.send),
                        )),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
