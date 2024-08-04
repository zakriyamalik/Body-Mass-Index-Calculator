import 'package:flutter/material.dart';
import 'constants.dart';


class upcardcontent extends StatelessWidget {

  final IconData icon ;
  final String gender; // to create a not required one property
  const upcardcontent({ required this.icon , required this.gender });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center ,
      children: [
        Icon(
          icon,
          size: 80,
          color: Color(0xFFFFFFFF),
        ),
        SizedBox(
          height: 25,
        ),
        Text(
            gender,
            style:
            upmidtext
        ),
      ],
    );
  }
}
