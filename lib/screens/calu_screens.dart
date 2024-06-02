import 'package:calu_app/widgets/calu_button.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  void buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "*") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "<") { // Backspace functionality
      if (_output.length == 1) {
        _output = "0";
      } else {
        _output = _output.substring(0, _output.length - 1);
      }
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0,
            ),
            child: Text(
              output,
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: [
                  CalculatorButton(text: "7", onPressed: buttonPressed),
                  CalculatorButton(text: "8", onPressed: buttonPressed),
                  CalculatorButton(text: "9", onPressed: buttonPressed),
                  CalculatorButton(text: "/", onPressed: buttonPressed),
                ],
              ),
              Row(
                children: [
                  CalculatorButton(text: "4", onPressed: buttonPressed),
                  CalculatorButton(text: "5", onPressed: buttonPressed),
                  CalculatorButton(text: "6", onPressed: buttonPressed),
                  CalculatorButton(text: "*", onPressed: buttonPressed),
                ],
              ),
              Row(
                children: [
                  CalculatorButton(text: "1", onPressed: buttonPressed),
                  CalculatorButton(text: "2", onPressed: buttonPressed),
                  CalculatorButton(text: "3", onPressed: buttonPressed),
                  CalculatorButton(text: "-", onPressed: buttonPressed),
                ],
              ),
              Row(
                children: [
                  CalculatorButton(text: ".", onPressed: buttonPressed),
                  CalculatorButton(text: "0", onPressed: buttonPressed),
                  CalculatorButton(text: "00", onPressed: buttonPressed),
                  CalculatorButton(text: "+", onPressed: buttonPressed),
                ],
              ),
              Row(
                children: [
                  CalculatorButton(text: "<", onPressed: buttonPressed), // Backspace button
                  CalculatorButton(text: "CLEAR", onPressed: buttonPressed),
                  CalculatorButton(text: "=", onPressed: buttonPressed),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}