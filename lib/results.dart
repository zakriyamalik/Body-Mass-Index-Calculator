import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusablecard.dart';
import 'inputpage.dart';

class results extends StatefulWidget {

  results({ required this.bmiresult,required this.resulttext,required this.interpretation , required this.urdu});

  final String bmiresult;
  final String resulttext;
  final String interpretation;
   bool urdu;

  @override
  State<results> createState() => _resultsState();
}

class _resultsState extends State<results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Row(
          children: [
            Text(widget.urdu?'BMI کیلکولیٹر':'BMI CALCULATOR'),
          ],

        ),



      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: resueablecard(
                color: activecardcolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.resulttext.toUpperCase(), style: resulttextstyleup),
                    Text(
                      widget.bmiresult,
                      style: resulttextstylemid,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left : 30 , right : 30) ,
                      child: Text(
                        widget.interpretation,
                        style: resulttextstyledown,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(

                      ),

                      onPressed: () {
                        // Show the dialog when the button is clicked
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => CustomDialogg(resulttext:widget.resulttext,urdu:widget.urdu),
                        );
                      },
                      child: Text(widget.urdu? 'تجاویز دکھائیں۔':'Show Suggestions',style: TextStyle(color: Colors.deepOrange),
                        textDirection: TextDirection.rtl,
                      ),
                    ),

                  ],
                ),
              )),
          ElevatedButton(
            style: ButtonStyle(
              minimumSize:MaterialStateProperty.all<Size>(Size.square(30),
              ),
              maximumSize: MaterialStateProperty.all<Size>(
                Size.square(30),
              ),
            ),

            onPressed: () {
              // Show the dialog when the button is clicked
              showDialog(
                context: context,
                builder: (BuildContext context) => CustomDialog(),
              );
            },
            child: Text(widget.urdu?'چارٹ دکھائیں۔':'Show Chart'),


          ),

          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(widget.urdu?'دوبارہ حساب':"RE-CALCULATE" , style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ), ),
              ),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.all(0.0),
              width: double.infinity,
              height: bottomcontheight,
            ),
          ),
        ],
      ),
    );
  }
}
class CustomDialogg extends StatelessWidget {
  String resulttext;
  bool urdu;
  late String s;
  CustomDialogg({ required this.resulttext,required this.urdu})
  {
    if (resulttext == 'overweight'||resulttext=='زیادہ وزن') {
      s = urdu?'متوازن غذا پر غور کریں۔ کارڈیو اور طاقت کی تربیت کی مشقیں آزمائیں۔':'Consider a balanced diet. Try cardio and strength training exercises.';
    } else if (resulttext == 'Underweight'|| resulttext=='کم وزن') {
      // Suggestions for Underweight
      s = urdu? 'غذائیت سے بھرپور غذائیں کھائیں۔ پٹھوں کی تعمیر کے لئے طاقت کی تربیت پر غور کریں۔':'Consume nutrient-dense foods. Consider strength training to build muscle.';
    } else if (resulttext == 'Normal'|| resulttext=='مناسب') {
      // Suggestions for normal weight
      s = urdu?'مجموعی صحت کے لیے متوازن غذا اور باقاعدہ ورزش کا معمول رکھیں':'Maintain a balanced diet and regular exercise routine for overall health.';
    }
    else
      {
        s='Pta ni';
      }
  }



  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:  <Widget>[
          Container(

            padding: EdgeInsets.all(40),
            child: Column(
              
              children: [
                Container(
                    child: Text("Suggestions", style: TextStyle(fontSize: 17)),
                  margin: EdgeInsets.only(bottom:10),
                ),
                Container
                  (child: Text(s),
                  margin: EdgeInsets.only(bottom:10),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog when the button is clicked
                  },
                  child: Text('Close بند کریں'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
