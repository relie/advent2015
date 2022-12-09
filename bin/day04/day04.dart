import 'dart:convert';
import 'package:crypto/crypto.dart';

void day04() {
  String prefix = 'iwrupvqb';
  part1(prefix);
}

void part1(String prefix) {
  bool go = true;
  int r = 0;
  while(go) {
    String result = md5.convert(utf8.encode(prefix+r.toString())).toString();
    //print(result);
    if ('000000'.matchAsPrefix(result) != null) {
      go = false;
    }
    r++;
  }

  print('Lowest number to generate MD5 hash that starts with 5 zeroes is ${r - 1}');
}