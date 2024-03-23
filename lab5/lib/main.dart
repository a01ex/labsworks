import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Список элементов'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  void navigateToWidget(Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () => navigateToWidget(const SimpleList()),
            child: const Text('Обычный список'),
          ),
          ElevatedButton(
            onPressed: () => navigateToWidget(const InfinityList()),
            child: const Text('Бесконечный список'),
          ),
          const Expanded(
            child: InfinityMathList(),
          ),
        ],
      ),
    );
  }
}

class SimpleList extends StatelessWidget {
  const SimpleList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Простой список'),
      ),
      body: ListView(
        children: const [
          ListTile(title: Text('Item 1')),
          ListTile(title: Text('Item 2')),
          ListTile(title: Text('Item 3')),
        ],
      ),
    );
  }
}

class InfinityList extends StatelessWidget {
  const InfinityList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Бесконечный список'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          key: ValueKey(index),
          title: Text('Item $index'),
        ),
      ),
    );
  }
}

class InfinityMathList extends StatelessWidget {
  const InfinityMathList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          key: ValueKey(index), // Добавлен ключ для оптимизации
          title: Text('2^$index = ${pow(2.0, index)}'),
        );
      },
    );
  }
}
