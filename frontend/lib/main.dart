import 'package:flutter/material.dart';

import 'package:velour/pages/signup.dart';
import 'package:velour/theme/app_theme.dart';

void main()
{
  runApp(const App());
}

class App extends StatelessWidget
{
  const App({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Velour',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      home: const SignupPage(),
    );
  }
}
