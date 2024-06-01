import 'package:flutter/material.dart';
import 'package:gemini_flutter/chat_page.dart';
import 'package:gemini_flutter/simple_chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gemini Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _gotoSimpleChatbot() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const ChatPage(
                chatType: ChatType.simple,
              )),
    );
  }

  void _gotoPretrainChatbot() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const ChatPage(
                chatType: ChatType.pretrain,
              )),
    );
  }

  void _gotoCharacterChatbot() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const ChatPage(
                chatType: ChatType.pretrainAndCharacter,
              )),
    );
  }

  void _gotoIntegrateChatbot() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const ChatPage(
                chatType: ChatType.functionCallback,
              )),
    );
  }

  void _gotoStartPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SimpleChat()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: _gotoStartPage,
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey.shade100)),
                child: const Text('Set up Generative AI ChatBot')),
            const SizedBox(height: 20),
            TextButton(
                onPressed: _gotoSimpleChatbot,
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey.shade100)),
                child: const Text('Simple ChatBot')),
            const SizedBox(height: 20),
            TextButton(
                onPressed: _gotoPretrainChatbot,
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey.shade100)),
                child: const Text('Pretrain ChatBot')),
            const SizedBox(height: 20),
            TextButton(
                onPressed: _gotoCharacterChatbot,
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey.shade100)),
                child: const Text('Pretrain and character ChatBot')),
            const SizedBox(height: 20),
            TextButton(
                onPressed: _gotoIntegrateChatbot,
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey.shade100)),
                child: const Text('Automated ChatBot')),
          ],
        ),
      ),
    );
  }
}
