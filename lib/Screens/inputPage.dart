import 'package:bmi_app/Screens/resultsPage.dart';
import 'package:bmi_app/Util/color.dart';
import 'package:bmi_app/Util/util.dart';
import 'package:bmi_app/Widgets/card.dart';
import 'package:bmi_app/Widgets/roundIconButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Func/calculatorBrain.dart';
import '../Widgets/bottomButton.dart';
import '../Widgets/genderWidget.dart';

enum Gender { male, female }
enum Weights { plus, minus }
enum Age { plus, minus }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? gender;
  double height = 180;
  int weight = 60;
  int age = 20;

  void updateGender(Gender selectedGender) {
    (selectedGender == Gender.male)
        ? setState(
            () {
              gender = Gender.male;
            },
          )
        : setState(
            () {
              gender = Gender.female;
            },
          );
  }

  void updateWeight(Weights clickedWeight) {
    (clickedWeight == Weights.plus)
        ? setState(() {
            weight++;
          })
        : setState(
            () {
              weight--;
            },
          );
  }

  void updateAge(Age ages) {
    (ages == Age.plus)
        ? setState(() {
            age++;
          })
        : setState(() {
            age--;
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      updateGender(Gender.male);
                    },
                    child: Cards(
                      color:
                          gender == Gender.male ? kActiveColor : kInactiveColor,
                      childContainer: const genderWidget(
                          gender: 'Male', icon: FontAwesomeIcons.mars),
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: (() {
                      updateGender(Gender.female);
                    }),
                    child: Cards(
                      color: gender == Gender.female
                          ? kActiveColor
                          : kInactiveColor,
                      childContainer: const genderWidget(
                          gender: 'Female', icon: FontAwesomeIcons.venus),
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
              child: Cards(
                color: kInactiveColor,
                childContainer: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kBigTextStyle,
                        ),
                        const Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: kTextColor,
                          inactiveTrackColor: kGreyColor,
                          thumbColor: kBottomColor,
                          overlayColor: kBottomColor.withOpacity(0.3),
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15.0),
                          overlayShape:
                              const RoundSliderOverlayShape(overlayRadius: 30)),
                      child: Slider(
                          min: 120,
                          max: 220,
                          value: height,
                          onChanged: (double selectedHeight) {
                            setState(() {
                              height = selectedHeight.roundToDouble();
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
                      child: Cards(
                    color: kInactiveColor,
                    childContainer: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Weight',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kBigTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              updatedWeight: () {
                                updateWeight(Weights.plus);
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            RoundIconButton(
                                updatedWeight: () {
                                  updateWeight(Weights.minus);
                                },
                                icon: FontAwesomeIcons.minus),
                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: Cards(
                    color: kInactiveColor,
                    childContainer: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kBigTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              updatedWeight: () {
                                updateAge(Age.plus);
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            RoundIconButton(
                                updatedWeight: () {
                                  updateAge(Age.minus);
                                },
                                icon: FontAwesomeIcons.minus),
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
            BottomButton(
                onTap: () {
                  CalculatorBrain calculatorBrain = CalculatorBrain(
                    height: height,
                    weight: weight.toDouble(),
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                              bmiResult: calculatorBrain.bmi(),
                              resultText: calculatorBrain.getResult(),
                              interpretation:
                                  calculatorBrain.getInterpretation()))
                      // Navigator.pushNamed(context, '/result', arguments: {});
                      );
                },
                buttonTiltle: 'CALCULATE'),
          ],
        ),
      ),
    );
  }
}
