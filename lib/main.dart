import 'package:flutter/material.dart';

import 'package:my_new_app/screens/screens.dart';
import 'package:my_new_app/theme_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return MaterialApp(
            title: 'Flutter Facebook UI',
            debugShowCheckedModeBanner: false,
            theme:   themeNotifier.getTheme(),
            home: NavScreen(),
          );
        },
      ),
    );
  }
}