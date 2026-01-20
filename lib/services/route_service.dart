import "dart:async";
import "dart:developer";

import "package:flutter/widgets.dart";
import "package:get/get.dart";

class RouteService {
  factory RouteService() {
    return _singleton;
  }

  RouteService._internal();
  static final RouteService _singleton = RouteService._internal();

  GlobalKey<NavigatorState> get key {
    return Get.key;
  }

  BuildContext get context {
    return key.currentContext!;
  }

  NavigatorState get state {
    return key.currentState!;
  }

  bool get canPop {
    return state.canPop();
  }

  Future<T?> pushNamed<T>(
    final String routeName, {
    final Map<String, dynamic> arguments = const <String, dynamic>{},
  }) async {
    T? value;

    try {
      value = await state.pushNamed<T?>(routeName, arguments: arguments);
    } on Exception catch (error, stackTrace) {
      log("Exception", error: error, stackTrace: stackTrace);
    } finally {}

    return Future<T?>.value(value);
  }

  Future<T?> pushNamedAndRemoveUntil<T>(
    final String routeName, {
    final Map<String, dynamic> arguments = const <String, dynamic>{},
  }) async {
    T? value;

    try {
      value = await state.pushNamedAndRemoveUntil<T?>(routeName, (
        Route<dynamic> route,
      ) {
        return false;
      }, arguments: arguments);
    } on Exception catch (error, stackTrace) {
      log("Exception", error: error, stackTrace: stackTrace);
    } finally {}

    return Future<T?>.value(value);
  }

  void pop<T>({final T? result}) {
    try {
      if (canPop) {
        state.pop<T>(result);
      } else {}
    } on Exception catch (error, stackTrace) {
      log("Exception", error: error, stackTrace: stackTrace);
    } finally {}

    return;
  }

  void popUntil(final String routeName) {
    try {
      if (canPop) {
        state.popUntil((Route<dynamic> route) {
          return route.settings.name == routeName;
        });
      } else {}
    } on Exception catch (error, stackTrace) {
      log("Exception", error: error, stackTrace: stackTrace);
    } finally {}

    return;
  }

  Future<void> routingObserver(final Routing? routing) async {
    final String? previous = routing?.previous;
    final String? current = routing?.current;
    final dynamic args = routing?.args;
    log("routingObserver: $previous → $current with: $args");

    return Future<void>.value();
  }
}
