import 'package:flutter/material.dart';
import 'tables/weight_table.dart';
import 'tables/height_table.dart';


class SearchCalculatorBrain {
  final double babyWeight;
  final double babyHeight;
  final int birthMonth;
  final String gender;

  String weightPercentile;
  String heightPercentile;

  String averWeight;
  String averHeight;

  SearchCalculatorBrain({@required this.babyWeight, @required this.birthMonth, @required this.gender, @required this.babyHeight});

  String findWeight(double birthWeight, int birthMonth, String gender) {
    if (gender == 'male') {
      weightPercentile =
          percentile[seq_search(birthWeight, BoyWeightTable[birthMonth])];
    } else {
      weightPercentile =
          percentile[seq_search(birthWeight, GirlWeightTable[birthMonth])];
    }
    print('weight percentile is $weightPercentile%.');
    return weightPercentile;
  }

  String findHeight(double birthHeight, int birthMonth, String gender) {
    if (gender == 'male') {
      heightPercentile =
      percentile[seq_search(birthHeight, BoyHeightTable[birthMonth])];
    } else {
      heightPercentile =
      percentile[seq_search(birthHeight, GirlHeightTable[birthMonth])];
    }
    print('height percentile is $heightPercentile%.');
    return heightPercentile;
  }

  String averageWeight(int birthMonth, String gender){
    if (gender == 'male'){
      averWeight = BoyWeightTable[birthMonth][7].toStringAsFixed(1);
    } else {
      averWeight = GirlWeightTable[birthMonth][7].toStringAsFixed(1);
    }
    return averWeight;
  }

  String averageHeight(int birthMonth, String gender){
    if (gender == 'male'){
      averHeight = BoyHeightTable[birthMonth][7].toStringAsFixed(1);
    } else {
      averHeight = GirlHeightTable[birthMonth][7].toStringAsFixed(1);
    }
    return averHeight;
  }


}

int seq_search(double key, List sequence) { //key는 검색하려는 값, sequence는 검색하려는 대상
  int i = 0;
  while (true) {
     if (i == 12) {
       print('over');
       return i;
    }else if (sequence[i] < key) {
      i++;
      print('i : $i, key : $key, percentile: ${percentile[i]} %');
    } else {
      print(i);
      return i;
    }
  }
}

List percentile = [
  '99',
  '97',
  '95',
  '90',
  '85',
  '75',
  '50',
  '25',
  '15',
  '10',
  '5',
  '3',
  '1'
];
