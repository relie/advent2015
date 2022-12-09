import 'dart:convert';
import 'dart:io';

void day02() {
  File('./bin/day02/input.txt').readAsString().then((String contents) {
    part1(LineSplitter().convert(contents));
    part2(LineSplitter().convert(contents));
  });
}

void part1(List<String> input) {
  int sum = 0;
  for (final line in input) {
    List<int> dimens = convertListSI(line.split('x'));
    List<int> areas = [
      dimens[0]*dimens[1],
      dimens[1]*dimens[2],
      dimens[2]*dimens[0],
    ];
    areas.sort((a,b) => a.compareTo(b));
    for (var element in areas) {
      sum += element*2;
    }
    sum += areas.first;
  }

  print('Total sq feet of wrapper is $sum');
}

void part2(List<String> input) {
  int sum = 0;
  for (final line in input) {
    List<int> dimens = convertListSI(line.split('x'));
    print(dimens);
    List<int> perimeters = [
      (dimens[0]+dimens[1])*2,
      (dimens[1]+dimens[2])*2,
      (dimens[2]+dimens[0])*2,
    ];
    perimeters.sort((a,b) => a.compareTo(b));
    print(perimeters);
    sum += perimeters.first;
    sum += (dimens[0]*dimens[1]*dimens[2]);
  }

  print('Total ribbon length is $sum');
}

List<int> convertListSI(List<String> strings) {
  return strings.map((e) => int.parse(e)).toList();
}