import 'package:flutter/material.dart';

class AdvicerDisplay extends StatelessWidget {
  const AdvicerDisplay({super.key,required this.advice});
  final advice;

  @override
  Widget build(BuildContext context) {
    final themeData= Theme.of(context);
    return Material(
      elevation: 15,
      color: themeData.colorScheme.onPrimary,
      borderRadius:BorderRadius.circular(20) ,
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
      child: Text("\"$advice\"",style: themeData.textTheme.bodyLarge,textAlign: TextAlign.center,),),

    );
  }
}