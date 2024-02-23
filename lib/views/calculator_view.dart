import 'package:flutter/material.dart';
import '../controllers/calculator_controller.dart';

class CalculatorView extends StatelessWidget {
  final CalculatorController controller = CalculatorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Калькулятор'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                controller.display,
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  buildRow(['7', '8', '9', '+']),
                  buildRow(['4', '5', '6', '-']),
                  buildRow(['1', '2', '3', '*']),
                  buildRow(['C', '0', '=', '/']),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRow(List<String> symbols) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: symbols.map((symbol) {
          return ElevatedButton(
            onPressed: () {
              if (symbol == 'C') {
                controller.clear();
              } else if (symbol == '=') {
                controller.evaluate();
              } else {
                controller.updateDisplay(symbol);
              }
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(20.0),
              minimumSize: Size(80.0, 80.0),
            ),
            child: Text(
              symbol,
              style: TextStyle(fontSize: 24.0),
            ),
          );
        }).toList(),
      ),
    );
  }
}
