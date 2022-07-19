import 'package:bmi_app/Util/color.dart';
import 'package:bmi_app/Util/util.dart';
import 'package:bmi_app/Widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Widgets/genderWidget.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? gender;
  double height = 180;
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
                  )),
                  Expanded(
                      child: Cards(
                    color: kInactiveColor,
                  )),
                ],
              ),
            ),
            Container(
              color: kBottomColor,
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: bottomContainerHeight,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {}),
        child: Icon(Icons.add),
      ),
    );
  }
}
