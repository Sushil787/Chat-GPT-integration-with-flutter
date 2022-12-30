import 'package:app_gpt/providers/gpt_data_provider.dart';
import 'package:app_gpt/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: ((context) => GptDataProvider()))
        ],
        child: ChatScreen(),
      ),
    );
  }
}
