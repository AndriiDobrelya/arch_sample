import 'package:arch_sample/features/presentation/breed_info/breed_info_page.dart';
import 'package:arch_sample/features/presentation/breeds/breeds_page.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: BreedsPage, initial: true),
    AutoRoute(page: BreedInfoPage, path: 'breed-info', fullscreenDialog: true),
  ],
)
class $Routes {}
