class CalculatorModel {
  late String _display = '';
  late double _firstOperand = 0.0;
  late String _operator = '';
  late bool _isOperatorPressed = false;

  void updateDisplay(String value) {
    if (value == 'C') {
      clear();
    } else if (value == '=') {
      evaluate();
    } else if (value == '+' || value == '-' || value == '*' || value == '/') {
      if (_display.isNotEmpty && !_isOperatorPressed) {
        _firstOperand = double.parse(_display);
        _display += value;
        _operator = value;
        _isOperatorPressed = true;
      }
    } else {
      _display += value;
    }
  }

  void clear() {
    _display = '';
    _firstOperand = 0.0;
    _operator = '';
    _isOperatorPressed = false;
  }

  void evaluate() {
    if (_display.isNotEmpty && _operator.isNotEmpty && !_isOperatorPressed) {
      double secondOperand = double.parse(_display.split(_operator)[1]);
      double result = 0.0;
      switch (_operator) {
        case '+':
          result = _firstOperand + secondOperand;
          break;
        case '-':
          result = _firstOperand - secondOperand;
          break;
        case '*':
          result = _firstOperand * secondOperand;
          break;
        case '/':
          if (secondOperand != 0) {
            result = _firstOperand / secondOperand;
          } else {
            result = double.infinity; // Handle division by zero
          }
          break;
        default:
          break;
      }
      _display = result.toString();
      _firstOperand = result;
      _operator = '';
      _isOperatorPressed = false;
    }
  }

  String get display => _display;
}
