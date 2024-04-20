import 'package:flutter/material.dart';
import 'package:flutter_chat_app/pages/consts.dart';
import 'package:flutter_chat_app/pages/homepage.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

void main() {
  Gemini.init(
    apiKey: GEMINI_API_KEY,
  );
  runApp(const ChatAi());
}

class ChatAi extends StatelessWidget {
  const ChatAi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Stylish',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: Homepage(),
    );
  }
}
