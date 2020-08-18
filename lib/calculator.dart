import 'package:flutter/material.dart';
import 'package:simple_calculator/equation.dart';

class Calculator extends StatefulWidget {
  Calculator({Key key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  void initState() {
    super.initState();
  }

  String ansStr = "";
  bool isSamadengan = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: ListView(
                reverse: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ansStr.isEmpty ? '0' : ansStr,
                      style: TextStyle(fontSize: 50.0, color: Colors.black),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _button("hapus"),
                      _button("^"),
                      _button("+/-"),
                      _button("AC"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _button("("),
                      _button(")"),
                      _button("%"),
                      _button("+"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _button("7"),
                      _button("8"),
                      _button("9"),
                      _button("-"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _button("4"),
                      _button("5"),
                      _button("6"),
                      _button("*"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _button("1"),
                      _button("2"),
                      _button("3"),
                      _button("/"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: [
                            _button("0"),
                            _button("."),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            _button("="),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _button(String tombol) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
          height: MediaQuery.of(context).size.height / 13,
          child: tombol == 'hapus'
              ? Icon(Icons.backspace)
              : Text(tombol,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
          textColor: Theme.of(context).primaryColorLight,
          color: Theme.of(context).primaryColorDark,
          onPressed: () {
            setState(() {
              if (num.tryParse(tombol) == null) {
                if (tombol == '=') {
                  isSamadengan = true;
                } else {
                  isSamadengan = false;
                }

                ansStr = Equation().addOperator(
                    currentAns: ansStr,
                    operasi: tombol,
                    lastAns:
                        ansStr.isEmpty ? 'empty' : ansStr[ansStr.length - 1]);
              } else {
                if (isSamadengan) {
                  ansStr = '';
                  isSamadengan = false;
                }
                ansStr =
                    Equation().addNumber(currentAns: ansStr, number: tombol);
              }
            });
          },
        ),
      ),
    );
  }
}
