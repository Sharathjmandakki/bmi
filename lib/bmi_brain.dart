import 'dart:math';

class bmi {
  bmi({required this.height, required this.weight});
  final int height;
  final int weight;
  var _bmi;
  String CalculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return "NORMAL";
    } else {
      return "UNDERWEIGHT";
    }
  }

  String getAdvice() {
    double a = 0;
    if (_bmi >= 25) {
      a = _bmi - 25.0;
      var b = a.toStringAsFixed(1);
      return 'you have $b kg more than normal body weight. Try to exercise more';
    } else if (_bmi > 18.5) {
      return "You have a normal body weight.Good job!";
    } else {
      a = 18.5 - _bmi;
      var b = a.toStringAsFixed(1);
      return "You have $b kg less then normal body weight. Bro..! eat more";
    }
  }
}
