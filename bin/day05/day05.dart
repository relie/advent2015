import 'dart:convert';
import 'dart:io';

void day05() {
  File('./bin/day05/input.txt').readAsString().then((String contents) {
    // part1(LineSplitter().convert(contents));
    part2(LineSplitter().convert(contents));
  });
}

void part1(List<String> input) {
  int niceCnt = 0;
  for (final line in input) {
    if (test1(line) && test2(line) && test3(line)) {
      niceCnt++;
    }
  }

  print('There are $niceCnt nice strings.');
}

void part2(List<String> input) {
  int niceCnt = 0;
  for (final line in input) {
    if (test4(line) && test5(line)) {
      niceCnt++;
    }
  }

  print('There are $niceCnt nice strings.');
}

bool test1(String subject) {
  List<String> tests = ['a', 'e', 'i', 'o', 'u'];
  int cnt = 0;
  for (final test in tests) {
    cnt += test.allMatches(subject).length;
  }
  if (cnt >= 3) {
    return true;
  }
  return false;
}

bool test2(String subject) {
  bool check = false;
  List<String> items = subject.split('');
  for (int r = 0; r < items.length-1; r++) {
    if (items[r] == items[r+1]) {
      return true;
    }
  }
  return false;
}

bool test3(String subject) {
  List<String> tests = ['ab','cd','pq','xy'];
  for (final test in tests) {
    if (subject.contains(test)) {
      return false;
    }
  }
  return true;
}

bool test4(String subject) {
  while(subject.isNotEmpty) {
    if (subject.length > 1) {
      String test = subject.substring(0, 2);
      int matchCnt = test.allMatches(subject.substring(2)).length;
      // print('There are $matchCnt matches for $test');
      if (matchCnt > 0) {
        return true;
      }
    }
    subject = subject.substring(1);
  }
  return false;
}

bool test5(String subject) {
  List<String> subjects = subject.split('');
  for (int r = 0; r < subjects.length-2; r++) {
    if (subjects[r] == subjects[r+2]) {
      return true;
    }
  }
  return false;
}