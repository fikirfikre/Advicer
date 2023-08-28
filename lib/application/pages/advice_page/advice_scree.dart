import 'package:advicer/application/core/service/theme_service.dart';
import 'package:advicer/application/pages/advice_page/bloc/advicer_bloc.dart';
import 'package:advicer/application/pages/advice_page/cubit/advicer_cubit.dart';
import 'package:advicer/application/pages/advice_page/widget/advice_diplay.dart';
import 'package:advicer/application/pages/advice_page/widget/custom_button.dart';
import 'package:advicer/application/pages/advice_page/widget/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../injection.dart';

class AdviceProviderWarpper extends StatelessWidget {
  const AdviceProviderWarpper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdvicerCubit>(
      create: (context) =>sl.get<AdvicerCubit>(),
      child: const AdvicePage(),
    );
  }
}

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Advicer",
          style: themeData.textTheme.headlineLarge,
        ),
        centerTitle: true,
        actions: [
          Switch(
              value: Provider.of<ThemeService>(context).isDarkMode,
              onChanged: (_) {
                Provider.of<ThemeService>(context, listen: false).toggleTheme();
              }),
        ],
      ),
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Expanded(child: Center(
              // child: AdvicerDisplay(advice: "Your Advice is waiting for you!"),
              // child: CircularProgressIndicator(
              //   color: themeData.colorScheme.secondary,
              // ),
              child: BlocBuilder<AdvicerCubit, AdvicerCubitState>(
                builder: (context, state) {
                  if (state is  AdvicerCubitLoadingState){
                  return    CircularProgressIndicator(
                color: themeData.colorScheme.secondary,
              );
                  }else if(state is AdvicerCubitInitial){
                    return AdvicerDisplay(advice: state.initial);
                  }
                  else if(state is AdvicerCubitLoadedState ){
                    return AdvicerDisplay(advice: state.advice);
                  }else if(state is AdvicerCubitErrorState){
                    return  ErrorMessage(message: state.message);
                  }
                  return Container();
                },
              ),
            )),
           const SizedBox(height: 200, child: Center(child: CustomeButton()))
          ],
        ),
      ),
    );
  }
}
