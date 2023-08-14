import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funny Quotes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> _quoteList = [
    '💐 Be the rainbow in someone else s cloud 🌈 ',
    '🧁 We love the things we love for what they are 🍭',
    '🌞 After every storm comes a rainbow 🌩',
    '🌤 It takes both rain and sunshine to make a rainbow 🌈',
    '🦜 Happiness comes in all colors! 🌟',
    '☃️Every day should have a little bit of rainbow in it 🦩',
    '🪐 Every sunset brings the promise of a new day 🫧 ',
    '🪆 Believe in yourself a little more ❤️',
  ];
  var _quote = _quoteList[0]; // state variable
  void _handleClickGo() {
    var rand = Random();

    var randomIndex = rand.nextInt(_quoteList.length);
    String newQuote = _quoteList[randomIndex];

    while(newQuote == _quote){
      randomIndex = rand.nextInt(_quoteList.length);
      newQuote = _quoteList[randomIndex];
    }
    setState(() {
      _quote = newQuote;
    });
}

  @override
  Widget build(BuildContext context) {
    var random = Random();
    return Scaffold(
      appBar: AppBar(title: const Text('Funny Caption')),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleClickGo,
        child: const Center(
          child: Text(
            'Next Quote',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(140.0),
          child: Text(
            _quote,
            style: TextStyle(
              fontSize: 32,
              color: Color.fromRGBO(random.nextInt(255), random.nextInt(255),
                  random.nextInt(255), 0.7),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
