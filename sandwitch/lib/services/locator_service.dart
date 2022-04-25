

import 'package:get_it/get_it.dart';

import 'nav_services.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
