import 'package:baby_growth/constants.dart';
import 'package:flutter/material.dart';
import '../reusable_card.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.weightRatio,
      @required this.heightRatio,
      @required this.averWeight,
      @required this.averHeight,
      @required this.month,
      @required this.gender,
      @required this.height,
      @required this.weight});

  final String weightRatio;
  final String heightRatio;
  final String averWeight;
  final String averHeight;
  final int month;
  final String gender;
  final double weight;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '영유아 성장 발달 계산기',
            style: TextStyle(color: Color(0xFF4C4F5E)),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kInactiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '측정 결과',
                      style: kResultTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '내 아이의 \n 체중은 $weight kg 상위 $weightRatio% 입니다.\n 신장은 ${height.toStringAsFixed(1)}cm 상위 $heightRatio% 입니다. ',
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '$month 개월 $gender 아이의 \n 평균 체중은 $averWeight kg 입니다. \n 평균 신장은 $averHeight cm 입니다.',
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: kBottomContainerHeight,
                color: kBottomContainerColor,
                child: Center(
                    child: Text(
                  '다시 계산하기',
                  style: kLabelTextStyle.copyWith(color: Colors.black),
                )),
                padding: EdgeInsets.only(bottom: 20.0),
              ),
            )
          ],
        ));
  }
}
