import 'package:ccvit/views/home_view.dart';
import 'package:ccvit/widgets/theme_inherited_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'config/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeSwitcherWidget(
      initialDarkModeOn: false,
      child: CodeChefVitBhopalApp(),
    );
  }
}

class CodeChefVitBhopalApp extends StatefulWidget {
  @override
  _CodeChefVitBhopalAppState createState() => _CodeChefVitBhopalAppState();
}

class _CodeChefVitBhopalAppState extends State<CodeChefVitBhopalApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ankit sagar',
      theme: ThemeSwitcher.of(context).isDarkModeOn
          ? darkTheme(context)
          : lightTheme(context),
      home: HomeView(),
    );
  }
}
