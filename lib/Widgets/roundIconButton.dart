import 'package:bmi_app/Util/color.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function updatedWeight;
  const RoundIconButton({Key? key, required this.icon, required this.updatedWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: (() => updatedWeight()),
      elevation: 6.0,
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
      fillColor: kIncDecButtonColor,
      child: Icon(
        icon,
        color: kTextColor,
      ),
    );
  }
}
