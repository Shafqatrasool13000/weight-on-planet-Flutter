import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';

/*
source: https://www.livescience.com/33356-weight-on-planets-mars-moon.html
Mercury: 0.38
Venus: 0.91
Earth: 1.00
Mars: 0.38
Jupiter: 2.34
Saturn: 1.06
Uranus: 0.92
Neptune: 1.19
Pluto: 0.06
formula:weight = mass x surface gravity
*/
class MyCustomView extends StatefulWidget {
  @override
  _MyCustomViewState createState() => _MyCustomViewState();
}

class _MyCustomViewState extends State<MyCustomView> {
  void _reset() {
    setState(() {
      _controller.clear();
      currentValue = 1;
      _newResult = 'Please Enter the Weight';
    });
  }

  final TextEditingController _controller = TextEditingController();
  int currentValue = 0;

  String _newResult = '';
  double _result = 0.0;

  void radioValueChangedCallBack(int value) {
    setState(() {
      currentValue = value;

      switch (currentValue) {
        case 0:
          _result = calculate(_controller.text, 0.38);
          _newResult = 'Your Weight on Mars is ${_result.toStringAsFixed(1)}';
          break;
        case 1:
          _result = calculate(_controller.text, 0.91);
          _newResult = 'Your Weight on Venus is $_result';
          break;
        case 2:
          _result = calculate(_controller.text, 0.06);
          _newResult = 'Your Weight on pluto is $_result';
          break;
      }
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: Image(
            width: 150,
            height: 150,
            image: AssetImage(
              'images/planet.png',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(7.0),
        ),
        TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            icon: Icon(Icons.perm_identity),
            labelText: 'Your Weight on Earth',
            hintText: 'Your Weight on Earth',
          ),
        ),
        Padding(
          padding: EdgeInsets.all(7.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio<int>(
                activeColor: Colors.brown,
                value: 0,
                groupValue: currentValue,
                onChanged: radioValueChangedCallBack),
            Text(
              'Mars',
              style: kPlanetsTextColors,
            ),
            Radio<int>(
                activeColor: Colors.orange,
                value: 1,
                groupValue: currentValue,
                onChanged: radioValueChangedCallBack),
            Text(
              'Venus',
              style: kPlanetsTextColors,
            ),
            Radio<int>(
                activeColor: Colors.yellow,
                value: 2,
                groupValue: currentValue,
                onChanged: radioValueChangedCallBack),
            Text(
              'Pluto',
              style: kPlanetsTextColors,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
        ),
        Text(
          _controller.text.isNotEmpty
              ? '$_newResult'
              : 'Please Enter your Weight',
          style: kWeightTextColors,
        ),
        RaisedButton(
          child: Text('Reset'),
          onPressed: _reset,
        ),
      ],
    );
  }
}

class RadioIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.radio_button_unchecked);
  }
}

double calculate(String weightController, double otherPlanetWeight) {
  if (weightController.isNotEmpty && int.parse(weightController) > 0) {
    return int.parse(weightController) * otherPlanetWeight;
  } else {
    print('Wrong');
  }
  return 0.0;
}
