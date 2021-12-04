import 'package:bmi_calculator/sex.dart';
import 'package:bmi_calculator/sex_card.dart';
import 'package:bmi_calculator/slider_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'reusable_card.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Sex? _selectedSex;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _createMaleFemaleRow(),
          SliderCard(),
          _createReusableDoubleCardRow(),
          Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
        ],
      ),
    );
  }

  Expanded _createReusableDoubleCardRow() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ReusableCard(
              color: kReusableInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Text(
                    weight.toString(),
                    style: kNumberTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        backgroundColor: kButtonColor,
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      FloatingActionButton(
                        child: Icon(
                          Icons.,
                          color: Colors.white,
                        ),
                        backgroundColor: kButtonColor,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kReusableInactiveCardColor,
              cardChild: Icon(
                FontAwesomeIcons.yoast,
                size: 80.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createMaleFemaleRow() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() {
                _selectedSex = Sex.MALE;
              }),
              child: SexCard(
                label: 'MALE',
                icon: FontAwesomeIcons.mars,
                color: _selectedSex == Sex.MALE
                    ? kReusableActiveCardColor
                    : kReusableInactiveCardColor,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() {
                _selectedSex = Sex.FEMALE;
              }),
              child: SexCard(
                label: 'FEMALE',
                icon: FontAwesomeIcons.venus,
                color: _selectedSex == Sex.FEMALE
                    ? kReusableActiveCardColor
                    : kReusableInactiveCardColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
