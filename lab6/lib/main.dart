import 'package:flutter/material.dart';

class MyCalculateArea extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyCalculateAreaState();
}

class MyCalculateAreaState extends State<MyCalculateArea> {
  final _formKey = GlobalKey<FormState>();
  int _width = 0;
  int _height = 0;
  int _area = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(children: <Widget>[
            Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text('Ширина (мм):')),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Задайте Ширину';
                    try {
                      _width = int.parse(value);
                    } catch (e) {
                      _width = -1;
                      return 'Введите число';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ]),
          const SizedBox(height: 10.0),
          Row(children: <Widget>[
            Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text('Высота (мм):')),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.number, // Укажите тип клавиатуры
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Задайте Высоту';
                    try {
                      _height = int.parse(value);
                    } catch (e) {
                      _height = -1;
                      return 'Введите число';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ]),
          const SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  _area = _width * _height;
                });
              }
            },
            child: const Text('Вычислить'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              textStyle: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 70.0),
          Text(
            'Задайте параметры :' 'S = $_width * $_height = $_area (мм²)',
            style: const TextStyle(fontSize: 30.0),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: const Text('Калькулятор площади')),
          body: MyCalculateArea(),
        ),
      ),
    );
