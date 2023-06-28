import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {
      int length = _list.length;
      _list.add((length + 1).toString());
    });
  }

  final List<String> _list = ['1', '2', '3'];

  Color getTileColor(String value) {
    int number = int.parse(value);
    if (number % 2 == 1) {
      return Colors.indigo;
    }
    return Colors.cyan;
  }

  Image getImage(String value) {
    int number = int.parse(value);
    if (isPremier(number)) {
      return Image.asset('images/ananas.png');
    } else if (number % 2 == 1) {
      return Image.asset('images/poire.png');
    }
    return Image.asset('images/pomme.png');
  }

  String getTitle() {
    int number = _list.length;
    if (isPremier(number)) {
      return '${_list.length} fruits premiers !';
    } else if (number % 2 == 1) {
      return '${_list.length} fruits impair';
    }
    return '${_list.length} fruits pair';
  }

  bool isPremier(int value) {
    if (value <= 1) {
      return false;
    }
    for (int i = 2; i <= value / 2; i++) {
      if (value % i == 0) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(getTitle()),
      ),
      body: Center(
          child: ListView(
        children: _list.map((String value) {
          return ListTile(
            title: Text(value),
            leading: getImage(value),
            textColor: Colors.white,
            tileColor: getTileColor(value),
          );
        }).toList(),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
