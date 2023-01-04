import 'package:bmi/bmi_brain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'designlayout.dart';
import 'topchildss.dart';
import 'results.dart';

const activecolor = Color(0xFF1D1E33);
const inactivecolor = Color(0xFF111328);
const numbertextstyle = TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900);
const referencetext = TextStyle(fontSize: 18, color: Color(0xFF8D8E98));

enum Gender {
  male,
  female,
}

class bodyofapp extends StatefulWidget {
  const bodyofapp({Key? key}) : super(key: key);

  @override
  State<bodyofapp> createState() => _bodyofappState();
}

class _bodyofappState extends State<bodyofapp> {
  Gender selectgender = Gender.male;
  int Height = 180;
  int weight = 40;
  int age = 20;
  // Color malecardcolor = inactivecolor;
  // Color femalecardcolor = inactivecolor;

  // void updatecolor(Gender gender) {
  //   if (gender == Gender.male) {
  //     if (malecardcolor == inactivecolor) {
  //       malecardcolor = activecolor;
  //       femalecardcolor = inactivecolor;
  //     } else {
  //       malecardcolor = inactivecolor;
  //     }
  //   }
  //   if (gender == Gender.female) {
  //     if (femalecardcolor == inactivecolor) {
  //       femalecardcolor = activecolor;
  //       malecardcolor = inactivecolor;
  //     } else {
  //       femalecardcolor = inactivecolor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectgender = Gender.male;
                    });
                  },
                  child: container(
                    colors: selectgender == Gender.male
                        ? activecolor
                        : inactivecolor,
                    cardChild: topchilds(
                      icon: FontAwesomeIcons.mars,
                      lable: "MALE",
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectgender = Gender.female;
                    });
                  },
                  child: container(
                    colors: selectgender == Gender.female
                        ? activecolor
                        : inactivecolor,
                    cardChild: topchilds(
                      icon: FontAwesomeIcons.venus,
                      lable: "FEMALE",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: container(
          colors: activecolor,
          cardChild: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "HEIGHT",
                  style: referencetext,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    Height.toString(),
                    style: numbertextstyle,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'cm',
                    style: referencetext,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbColor: Color(0xFFEB1555),
                  inactiveTickMarkColor: Color(0xFF8D8E98),
                  activeTrackColor: Colors.white,
                  overlayColor: Colors.red,
                  thumbShape: RoundSliderThumbShape(disabledThumbRadius: 15),
                  overlayShape: RoundSliderThumbShape(pressedElevation: 30),
                ),
                child: Slider(
                  value: Height.toDouble(),
                  min: 60,
                  max: 240,
                  onChanged: (double newValue) {
                    setState(() {
                      Height = newValue.round();
                    });
                  },
                ),
              ),
            ],
          ),
        )),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: container(
                  colors: activecolor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: referencetext,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        weight.toString(),
                        style: numbertextstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          addorsub(
                            icon: CupertinoIcons.minus,
                            onPressed: () {
                              setState(() {
                                if (weight <= 0) {
                                  weight = 0;
                                } else {
                                  weight--;
                                }
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          addorsub(
                            icon: Icons.add,
                            onPressed: () {
                              setState(() {
                                if (weight >= 150) {
                                  weight = 150;
                                } else {
                                  weight++;
                                }
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: container(
                  colors: activecolor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: referencetext,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        age.toString(),
                        style: numbertextstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          addorsub(
                            icon: CupertinoIcons.minus,
                            onPressed: () {
                              setState(() {
                                if (age <= 0) {
                                  age = 0;
                                } else {
                                  age--;
                                }
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          addorsub(
                            icon: Icons.add,
                            onPressed: () {
                              setState(() {
                                if (age >= 100) {
                                  age = 100;
                                } else {
                                  age++;
                                }
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        botombutton(
            ontap: () {
              bmi cal = bmi(height: Height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => results(
                          Calalculate_bmi: cal.CalculateBMI(),
                          getResult: cal.getResult(),
                          getAdvice: cal.getAdvice(),
                        )),
              );
            },
            buttonlable: "CALCULATE")
      ],
    );
  }
}

class addorsub extends StatelessWidget {
  addorsub({required this.icon, required this.onPressed});
  final IconData icon;
  var value;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
