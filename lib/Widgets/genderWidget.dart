import 'package:bmi_app/Util/color.dart';
import 'package:flutter/material.dart';

import '../Util/util.dart';

class genderWidget extends StatelessWidget {
  final String gender;
  final IconData icon;
  const genderWidget({
    Key? key,
    required this.gender,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: kTextColor,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
