import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key,required this.message});
  final message;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      const  Icon(Icons.error,color:Colors.red,size: 40,),
        Text(message,style: themeData.textTheme.displayLarge,textAlign: TextAlign.center,)

      ],
    );
  }
}