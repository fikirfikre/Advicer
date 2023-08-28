import 'package:advicer/application/core/service/theme_service.dart';
import 'package:advicer/application/pages/advice_page/advice_scree.dart';
import 'package:advicer/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'injection.dart' as d;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await d.init();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context,themeService,child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
            themeMode: themeService.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            // title: 'Flutter Demo',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            home: const AdviceProviderWarpper());
      }
    );
  }
}
