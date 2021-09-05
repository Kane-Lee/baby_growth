import 'package:baby_growth/pages/results_page.dart';
import 'package:baby_growth/search_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../icon_content.dart';
import '../reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String selectedGender = 'male';
  double height = 80.0;
  double weight = 3.0;
  int intWeight = 30;
  int age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              '영유아 성장 발달 계산기',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = 'male';
                          });
                        },
                        colour: selectedGender == 'male'
                            ? kActiveCardColour
                            : kInactiveCardColour,
                        cardChild: IconContent(
                            iconName: FontAwesomeIcons.mars,
                            contentName: '아들')),
                  ),
                  Expanded(
                    child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = 'female';
                          });
                        },
                        colour: selectedGender == 'female'
                            ? kActiveCardColour
                            : kInactiveCardColour,
                        cardChild: IconContent(
                            iconName: FontAwesomeIcons.venus,
                            contentName: '딸')),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '키',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          height.toStringAsFixed(1),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          overlayColor: Color(0x29EB1555),
                          thumbColor: Color(0xFFF5C3C2)),
                      child: Slider(
                          value: height,
                          min: 40.0,
                          max: 120.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue;
                              print(
                                  'weight : $weight, height : $height, month : $age');
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '체중',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toStringAsFixed(1),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      intWeight++;
                                      weight = intWeight / 10;
                                      print(
                                          'weight : $weight, height : $height, month : $age');
                                    });
                                  }),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      intWeight--;
                                      weight = intWeight / 10;
                                      print(
                                          'weight : $weight, height : $height, month : $age');
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '개월 수',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                      print(
                                          'weight : $weight, height : $height, month : $age');
                                    });
                                  }),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                      print(
                                          'weight : $weight, height : $height, month : $age');
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                SearchCalculatorBrain calc = SearchCalculatorBrain(
                    babyWeight: weight,
                    birthMonth: age,
                    babyHeight: height,
                    gender: selectedGender);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            weightRatio:
                                calc.findWeight(weight, age, selectedGender),
                            heightRatio:
                                calc.findHeight(height, age, selectedGender),
                            averWeight: calc.averageWeight(age, selectedGender),
                            averHeight: calc.averageHeight(age, selectedGender),
                            month: age,
                            gender: selectedGender,
                        height: height,
                          weight: weight,
                          )),
                );
              },
              child: Container(
                child: Center(
                    child: Text(
                  '계산하기',
                  style: kLabelTextStyle.copyWith(color: Colors.black),
                )),
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: kBottomContainerHeight,
                color: kBottomContainerColor,
              ),
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(icon, color: Colors.white),
        elevation: 0.0,
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
        onPressed: onPressed);
  }
}
