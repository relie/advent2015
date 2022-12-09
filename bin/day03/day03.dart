import 'dart:convert';
import 'dart:io';

void day03() {
  File('./bin/day03/input.txt').readAsString().then((String contents) {
    // part1(contents.split(''));
    part2(contents.split(''));
  });
}

void part1(List<String> input) {
  int x = 0;
  int y = 0;
  List<String> distinct = ['0#0'];
  int cnt = 0;
  for (final dir in input) {
    switch(dir) {
      case '>':
        x++;
        break;
      case '<':
        x--;
        break;
      case '^':
        y++;
        break;
      case 'v':
        y--;
        break;
      default:
        break;
    }
    String ident = x.toString()+'#'+y.toString();
    if (!distinct.contains(ident)) {
      distinct.add(ident);
    }
    cnt++;
  }

  print('Number of distinct houses is ${distinct.length}.');
}

void part2(List<String> input) {
  int x = 0;
  int y = 0;
  int rx = 0;
  int ry = 0;
  List<String> distinct = ['0#0'];
  int cnt = 0;
  for (final dir in input) {
    switch(dir) {
      case '>':
        if (cnt%2 == 0) {
          x++;
        } else {
          rx++;
        }
        break;
      case '<':
        if (cnt%2 == 0) {
          x--;
        } else {
          rx--;
        }
        break;
      case '^':
        if (cnt%2 == 0) {
          y++;
        } else {
          ry++;
        }
        break;
      case 'v':
        if (cnt%2 == 0) {
          y--;
        } else {
          ry--;
        }
        break;
      default:
        break;
    }
    String ident = cnt%2 == 0 ? x.toString()+'#'+y.toString() : rx.toString()+'#'+ry.toString();
    if (!distinct.contains(ident)) {
      distinct.add(ident);
    }
    cnt++;
  }

  print('Number of distinct houses is ${distinct.length}.');
}