import 'package:advicer/presentation/theme_animation/theme_screen.dart';
import 'package:flutter/material.dart';

import 'presentation/counter/counter_screen.dart';

class RootNaviagtionState extends StatefulWidget {
  const RootNaviagtionState({super.key});

  @override
  State<RootNaviagtionState> createState() => _RootNaviagtionStateState();
}

class _RootNaviagtionStateState extends State<RootNaviagtionState> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: IndexedStack(index: _currentIndex,
      children:const <Widget> [
        CounterScreen(title: "Counter"),
        ThemeAnimation()
      ],
      ),
    
    
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value){
          setState(() {
            _currentIndex = value;
          });
        },
        
        currentIndex: _currentIndex,
        items: const[
        BottomNavigationBarItem(icon: Icon(Icons.add),label:'counter'),
        BottomNavigationBarItem(icon: Icon(Icons.color_lens),label: 'theme')
      ]),
    );
  }
}