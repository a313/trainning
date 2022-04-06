import 'dart:math';

class MathUtil {
  static double randomDouble([num max = 100]) {
    return Random().nextDouble() * max;
  }

  static int randomInt([int max = 100]) {
    return Random().nextInt(max);
  }
}
