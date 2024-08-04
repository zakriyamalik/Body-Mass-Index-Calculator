import 'package:flutter/material.dart';
import 'reusablecard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'upcardcontent.dart';
import 'constants.dart';
import 'roundbutton.dart';
import 'results.dart';
import 'calculator_brain.dart';

enum gendertype {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  gendertype? slectedgender;

  int height = 180;
  int weight = 50;
  int age = 15;
  bool urdu=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Row(
            children: [
              Text(urdu?'BMI کیلکولیٹر':'BMI CALCULATOR'),
              Switch(value: urdu ,onChanged: (value) {
                setState(() {
                  urdu=!urdu;
                });
            },
                  activeColor: Colors.red
                // Implement the logic when the switch value changes
                // You can use the newValue to perform actions
                // Add your logic here based on the newValue
              ,)
            ],
          ),



        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        child: resueablecard(
                          color: slectedgender == gendertype.male
                              ? activecardcolor
                              : inactivecardcolor,
                          cardChild: upcardcontent(
                            icon: FontAwesomeIcons.mars,
                            gender:urdu?'مرد': 'MALE',
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            slectedgender = gendertype.male;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        child: resueablecard(
                          color: slectedgender == gendertype.female
                              ? activecardcolor
                              : inactivecardcolor,
                          cardChild: upcardcontent(
                            icon: FontAwesomeIcons.venus,
                            gender:urdu?'عورت': "FEMALE",
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            slectedgender = gendertype.female;
                          });
                        },
                      ),
                    )
                  ],
                )),
            Expanded(
              child: resueablecard(
                color: activecardcolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      urdu? 'لمبائی':'Height',
                      style: upmidtext,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: boldtext,
                        ),
                        Text(
                          "cm",
                          style: upmidtext,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                        RoundSliderThumbShape(enabledThumbRadius: 15),
                        trackHeight: 1,
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          activeColor: Color(0xFFEB1555),
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newvalue) {
                            setState(() {
                              height = newvalue.round();
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: resueablecard(
                        color: activecardcolor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(urdu?'وزن':'WEIGHT', style: upmidtext),
                            Text(
                              weight.toString(),
                              style: boldtext,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                roundbutton(
                                  child: Icon(
                                    Icons.remove,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  onpressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                SizedBox(width: 10),
                                roundbutton(
                                  child: Icon(Icons.add,
                                      size: 30, color: Colors.white),
                                  onpressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: resueablecard(
                        color: activecardcolor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(urdu?'عمر':"AGE", style: upmidtext),
                            Text(
                              age.toString(),
                              style: boldtext,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                roundbutton(
                                  child: Icon(
                                    Icons.remove,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  onpressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                SizedBox(width: 10),
                                roundbutton(
                                  child: Icon(Icons.add,
                                      size: 30, color: Colors.white),
                                  onpressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),

            Container(
              margin:  EdgeInsets.all(0.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  minimumSize:MaterialStateProperty.all<Size>(Size.square(30), // or Size(10, 10) for a rectangle size
                  ),
                  maximumSize: MaterialStateProperty.all<Size>(
                    Size.square(30), // or Size(10, 10) for a rectangle size
                  ),
                ),

                onPressed: () {
              // Show the dialog when the button is clicked
              showDialog(
              context: context,
              builder: (BuildContext context) => CustomDialog(),
              );
              },
              child:Text(urdu?'چارٹ دکھائیں۔':'Show Chart'),


                ),
            ),

            Container(
              margin: EdgeInsets.all(0.0),
              child: GestureDetector(
                onTap: (){

                  CalculatorBrain calbrain  = CalculatorBrain(height: height, weight: weight);


                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return results(
                      bmiresult: calbrain.calculateBMI() ,
                      resulttext: calbrain.getresult(urdu),
                      interpretation: calbrain.getInterpretation(urdu) ,
                      urdu: urdu,

                    );

                  }));
                },
                child: Container(
                  margin:EdgeInsets.all(0.0),
                  child: Center(
                    child: Text(urdu?'اپنے BMI کا حساب لگائیں':'CALCULATE YOUR BMI' , style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ), ),
                  ),
                  color: Color(0xFFEB1555),

                  width: double.infinity,
                  height: bottomcontheight,
                ),
              ),
            ),
          ],
        ));
  }
}

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image(image:
          AssetImage('../assets/bmi-chart.png'),
          ), // Replace 'assets/chart.png' with your image path
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog when the button is clicked
            },
            child: Text('Close بند کریں'),
          ),
        ],
      ),
    );
  }
}
