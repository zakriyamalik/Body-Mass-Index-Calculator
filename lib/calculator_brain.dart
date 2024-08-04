import 'dart:math'; // Import the math library

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;

  double get _bmi => weight / pow(height / 100, 2);

  String calculateBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getresult(bool urdu){
    if( _bmi >= 25 ){
      return urdu?'زیادہ وزن':'overweight';
    }else if (_bmi > 18.5 ){
      return urdu?'مناسب':'Normal';
    }else {
      return urdu?'کم وزن':'Underweight';
    }

  }

  String getInterpretation(bool urdu) {
    if (_bmi >= 25) {
      return urdu?'آپ کا وزن عام جسمانی وزن سے زیادہ ہے۔ زیادہ ورزش کرنے کی کوشش کریں۔':'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return urdu?'آپ کا جسمانی وزن نارمل ہے۔ بہت اعلی!':'You have a normal body weight. Good job!';
    } else {
      return urdu?'آپ کا جسمانی وزن معمول سے کم ہے۔ آپ تھوڑا سا زیادہ کھا سکتے ہیں۔':'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
