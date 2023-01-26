import 'package:arch_sample/features/presentation/breeds/breeds_screen.dart';
import 'package:flutter/material.dart';

class AppEntry extends StatefulWidget {
  const AppEntry({super.key});

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
