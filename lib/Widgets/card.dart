import 'package:flutter/material.dart';

import '../Util/color.dart';

class Cards extends StatelessWidget {
  final Widget? childContainer;
  final Color color;
  
  const Cards({
    Key? key, this.childContainer, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: childContainer,
    );
  }
}
