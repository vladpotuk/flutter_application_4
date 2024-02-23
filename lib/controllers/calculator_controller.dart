import '../models/calculator_model.dart';

class CalculatorController {
  late CalculatorModel _model;

  CalculatorController() {
    _model = CalculatorModel();
  }

  void updateDisplay(String value) {
    _model.updateDisplay(value);
  }


  String get display => _model.display;

  void clear() {
    _model.clear();
  }

  void evaluate() {
    _model.evaluate();
  }
}
