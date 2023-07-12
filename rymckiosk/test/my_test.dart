import 'dart:math';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Random num', () {
    final int n = Random().nextInt(10);
    print(n);
    expect(n, 10);
  });
}
