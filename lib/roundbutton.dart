import 'package:flutter/material.dart';

class roundbutton extends StatelessWidget {

  roundbutton({required this.child , required this.onpressed });
  final Widget? child;
  final VoidCallback? onpressed;


  @override
  Widget build(BuildContext context) {
    return  RawMaterialButton(

      child: child,
      onPressed:onpressed ,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0,height:56.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10) ),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
