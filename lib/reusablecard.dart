import 'package:flutter/material.dart';

class resueablecard extends StatelessWidget {

  final Color color;
  final Widget? cardChild; // to create a not required one property

  const resueablecard({ required this.color , this.cardChild });




  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild ,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color ,
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}
