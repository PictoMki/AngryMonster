import 'dart:math';

class RandomLogic {
  bool randomBool(int count) {
    const _randomChars = "23456789";
    const _charsLength = _randomChars.length;

    final rand = new Random();
    final codeUnits = new List.generate(
      2,
          (index) {
        final n = rand.nextInt(_charsLength);
        return _randomChars.codeUnitAt(n);
      },
    );
    var resultString = new String.fromCharCodes(codeUnits);
    var resultInt = int.parse(resultString);
    if (resultInt % count == 3) {
      return true;
    }else{
      return false;
    }
  }
}

