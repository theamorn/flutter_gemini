import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class SimpleChat extends StatefulWidget {
  const SimpleChat({super.key});

  @override
  State<SimpleChat> createState() => _SimpleChatState();
}

// create statelessWidget
class _SimpleChatState extends State<SimpleChat> {
  String responseText = 'Simple Chat';
  @override
  void initState() {
    super.initState();
    final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: 'YOUR_API_KEY',
    );

    const prompt = '''what's MAKE by KBank''';
    final content = [Content.text(prompt)];
    model.generateContent(content).then((value) => setState(() {
          responseText = value.text ?? 'No response';
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SafeArea(child: Text(responseText))),
      ),
    );
  }
}
