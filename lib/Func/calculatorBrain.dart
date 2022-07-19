import 'dart:math';

class CalculatorBrain {
  double? height;
  double? weight;

  CalculatorBrain({required this.height, required this.weight});

  double? _bmi;

  String bmi() {
    _bmi = (weight! / pow(height! / 100, 2));
    return _bmi!.toStringAsFixed(1);
  }

  String getResult() {
    if (25 <= _bmi!) {
      return 'Overweight';
    } else if (18.5 <= _bmi!) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getInterpretation() {
    if (25 <= _bmi!) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (18.5 <= _bmi!) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
