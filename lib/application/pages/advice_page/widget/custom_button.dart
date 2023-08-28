import 'package:advicer/application/core/service/theme_service.dart';
import 'package:advicer/application/pages/advice_page/bloc/advicer_bloc.dart';
import 'package:advicer/application/pages/advice_page/cubit/advicer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CustomeButton extends StatelessWidget {
  const CustomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return InkResponse(
         onTap: (){
          BlocProvider.of<AdvicerCubit>(context).requestAdvice();
         },
         child: Material(
          elevation: 10,
          color: themeData.colorScheme.secondary,
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 15),
            child: Text("GET ADVICE",style: themeData.textTheme.displayLarge,),
          ),
          
         ),
    );
  }
}