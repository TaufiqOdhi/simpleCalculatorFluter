import 'package:math_expressions/math_expressions.dart';

class Equation {
  String addNumber({String currentAns, String number}) {
    return currentAns += number;
  }

  String addOperator({String currentAns, String operasi, String lastAns}) {
    if (operasi == 'AC') {
      return '';
    }
    if (operasi == '+/-') {
      if (currentAns[0] == '-') {
        return currentAns.substring(1);
      } else {
        return '-' + currentAns;
      }
    }
    if (operasi == 'hapus') {
      return currentAns.substring(0, currentAns.length - 1);
    }
    if (operasi == '=') {
      if (currentAns.isNotEmpty) {
        try {
          return Parser()
              .parse(currentAns)
              .evaluate(EvaluationType.REAL, null)
              .toString();
        } catch (e) {
          return 'Syntax Error';
        }
      }
    }
    if (currentAns.contains('(')) {
      return currentAns += operasi;
    }

    if (num.tryParse(lastAns) == null && (operasi != '(')) {
      if (operasi != lastAns) {
        return currentAns.replaceRange(
            currentAns.length - 1, currentAns.length, operasi);
      }
      return currentAns;
    }
    return currentAns += operasi;
  }
}
