import 'package:flutter/material.dart';
import 'package:vidtube/tab_bar.dart';

import 'core/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VidTube',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkAppTheme,
      home: CustomTabBar(),
    );
  }
}
