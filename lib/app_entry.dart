import 'package:arch_sample/screens/breeds/breeds_screen.dart';
import 'package:flutter/material.dart';

class AppEntry extends StatefulWidget {
  const AppEntry({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppEntryState();
}

class _AppEntryState extends State<AppEntry> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sample Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
