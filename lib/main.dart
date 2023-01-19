import 'package:arch_sample/app_entry.dart';
import 'package:arch_sample/dependencies.dart';
import 'package:flutter/material.dart';

void main() {
  setupServiceLocator();
  runApp(const AppEntry());
}

