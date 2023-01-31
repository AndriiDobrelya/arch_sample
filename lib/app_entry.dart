import 'package:arch_sample/configs/app_router.dart';
import 'package:flutter/material.dart';

class AppEntry extends StatefulWidget {
  AppEntry({super.key});

  final _router = AppRouter();

  @override
  State<StatefulWidget> createState() => _AppEntryState();
}

class _AppEntryState extends State<AppEntry> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Sample Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: widget._router.delegate(),
      routeInformationParser: widget._router.defaultRouteParser(),
    );
  }
}
