import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @lazySingleton
  AutoRouteObserver get autoRouteObserver => AutoRouteObserver();
}
