import 'package:arch_sample/features/presentation/breed_info/breed_info_screen.dart';
import 'package:arch_sample/features/presentation/breeds/breeds_screen.dart';
import 'package:auto_route/auto_route.dart';

const autoRoutes = <AutoRoute>[
  AutoRoute(page: BreedsScreen, path: BreedsScreen.path, initial: true),
  AutoRoute(page: BreedInfoScreen, path: BreedInfoScreen.path),
];
