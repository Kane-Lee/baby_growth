import 'package:baby_growth/constants.dart';
import 'package:flutter/material.dart';
import '../reusable_card.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.weightRatio, @required this. heightRatio});

  final String weightRatio;
  final String heightRatio;

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

                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 50),Text(
                      'Result Text',
                      style: kResultTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 50),

                    Text(
                      '체중 : 상위 $weightRatio% 입니다.',
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '신장 : 상위 $heightRatio% 입니다.',
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),

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
        )
    );
  }
}
