import 'package:arch_sample/features/presentation/breed_info/breed_info_screen.dart';
import 'package:arch_sample/features/presentation/breeds/breeds_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:arch_sample/features/domain/entities/breed_info.dart';
import 'package:arch_sample/configs/routes.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: autoRoutes,
)
class AppRouter extends _$AppRouter {}
