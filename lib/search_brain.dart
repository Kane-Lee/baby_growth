import 'package:flutter/material.dart';
import 'tables/weight_table.dart';

class SearchCalculatorBrain {
  final double babyWeight;
  final double babyHeight;
  final int birthMonth;
  final String gender;

  String weightPercentile;
  String heightPercentile;

  SearchCalculatorBrain({@required this.babyWeight, @required this.birthMonth, @required this.gender, @required this.babyHeight});

  String findWeight(double birthWeight, int birthMonth, String gender) {
    if (gender == male) {
      weightPercentile =
          percentile[seq_search(birthWeight, BoyWeightTable[birthMonth])];
    } else {
      weightPercentile =
          percentile[seq_search(birthWeight, GirlWeightTable[birthMonth])];
    }
    return weightPercentile;
  }

  String findHeight(double birthHeight, int birthMonth, String gender) {
    if (gender == male) {
      weightPercentile =
      percentile[seq_search(birthHeight, BoyHeightTable[birthMonth])];
    } else {
      weightPercentile =
      percentile[seq_search(birthHeight, GirlHeightTable[birthMonth])];
    }
    return heightPercentile;
  }
}

int seq_search(double key, List sequence) {
  int i = 0;
  while (true) {
    if (i == sequence.length) {
      return i;
    }
    if (sequence[i] < key) {
      i++;
    } else {
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
