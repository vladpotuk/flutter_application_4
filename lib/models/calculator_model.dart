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
      _result = double.parse(_display);
      _display = _result.toString();
    } catch (e) {
      _display = 'Error';
    }
  }
}
