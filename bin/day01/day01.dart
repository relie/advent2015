import 'dart:io';

void day01() {
  File('./bin/day01/input.txt').readAsString().then((String contents) {
    part2(contents.split(''));
  });
}

void part1(List<String> characters) {
  int upCnt = 0;
  int downCnt = 0;
  for (final dirChar in characters) {
    switch(dirChar) {
      case '(': upCnt++; break;
      case ')': downCnt++; break;
      default: break;
    }
  }

  print('Moved up $upCnt times and down $downCnt times. Ending floor is ${upCnt-downCnt}');
}

void part2(List<String> characters) {
  int finalFloor = 0;
  int firstDown = 0;
  for (int r = 0; r < characters.length; r++) {
    switch(characters[r]) {
      case '(': finalFloor++; break;
      case ')': finalFloor--; break;
      default: break;
    }
    if (finalFloor < 0 && firstDown == 0) {
      firstDown = r;
    }
  }

  print('Ending floor is $finalFloor. Went to the basement at ${firstDown+1}');
}