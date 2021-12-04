import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class SexCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  SexCard({required this.label, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      color: color,
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80.0,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            label,
            style: kLabelTextStyle,
          )
        ],
      ),
    );
  }
}
