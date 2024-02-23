import 'dart:math';

class CalculatorModel {
  late String _display = '';
  late double _result = 0.0;

  void updateDisplay(String value) {
    _display += value;
  }

  String get display => _display;

  void clear() {
    _display = '';
    _result = 0.0;
  }

  void evaluate() {
    try {
      // Используем выражение Dart для вычисления результата
      // Здесь простой парсинг выражения
      final expression = _display.replaceAll('x', '*'); // Заменяем 'x' на '*' для умножения
      _result = _evaluateExpression(expression);
      _display = _result.toString();
    } catch (e) {
      _display = 'Error';
    }
  }

  double _evaluateExpression(String expression) {
    // Простая реализация вычисления математического выражения
    // Можно использовать библиотеки, такие как math_expressions, для более сложных вычислений

    // Например, вы можете добавить поддержку операторов +, -, *, / и скобок
    // Здесь пример реализации для простых вычислений без учета приоритета операций

    List<String> operators = ['+', '-', '*', '/'];
    List<String> expressionList = [];

    // Добавляем пробелы между операторами и числами
    for (int i = 0; i < expression.length; i++) {
      if (operators.contains(expression[i])) {
        expressionList.add(' ${expression[i]} ');
      } else {
        expressionList.add(expression[i]);
      }
    }

    List<String> tokens = expressionList.join('').split(' ');

    double result = double.parse(tokens[0]);
    String currentOperator = '';

    for (int i = 1; i < tokens.length; i++) {
      if (operators.contains(tokens[i])) {
        currentOperator = tokens[i];
      } else {
        double nextNumber = double.parse(tokens[i]);
        switch (currentOperator) {
          case '+':
            result += nextNumber;
            break;
          case '-':
            result -= nextNumber;
            break;
          case '*':
            result *= nextNumber;
            break;
          case '/':
            result /= nextNumber;
            break;
          default:
            throw Exception('Недопустимый оператор: $currentOperator');
        }
      }
    }

    return result;
  }
}
