import 'package:flutter/material.dart';
import 'weight_table.dart';

class SearchCalculatorBrain {
  final double birthWeight;
  final int birthMonth;

  SearchCalculatorBrain(
      {@required this.birthWeight, @required this.birthMonth});

  String findWeight(double birthWeight, int birthMonth) {
    String weightPercentile =
        percentile[seq_search(birthWeight, weightTable[birthMonth])];
    return weightPercentile;
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