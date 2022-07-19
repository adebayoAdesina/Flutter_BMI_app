import 'package:flutter/material.dart';

import '../Util/color.dart';
import '../Util/util.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonTiltle;
  const BottomButton({
    Key? key,
    required this.onTap,
    required this.buttonTiltle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => onTap()),
      child: Container(
        color: kBottomColor,
        margin: const EdgeInsets.only(
          top: 10,
        ),
        padding: const EdgeInsets.only(
          bottom: 20,
        ),
        width: double.infinity,
        height: bottomContainerHeight,
        child: Center(
          child: Text(
            buttonTiltle,
            style: kCalculateStyle,
          ),
        ),
      ),
    );
  }
}
