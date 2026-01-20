import "package:get/get.dart";
import "package:unknown_route_sample/bindings/screen_one_binding.dart";
import "package:unknown_route_sample/bindings/screen_two_binding.dart";
import "package:unknown_route_sample/bindings/unknown_route_binding.dart";
import "package:unknown_route_sample/screens/screen_one.dart";
import "package:unknown_route_sample/screens/screen_two.dart";
import "package:unknown_route_sample/screens/unknown_route_screen.dart";

class RoutesUtil {
  factory RoutesUtil() {
    return _singleton;
  }

  RoutesUtil._internal();
  static final RoutesUtil _singleton = RoutesUtil._internal();

  String get unknownRouteScreen => "/unknownRouteScreen";

  String get screenOne => "/screenOne";
  String get screenTwo => "/screenTwo";

  GetPage<dynamic> get getUnknownPage {
    return GetPage<dynamic>(
      name: unknownRouteScreen,
      page: UnknownRouteScreen.new,
      binding: UnknownRouteBinding(),
    );
  }

  List<GetPage<dynamic>> get getPages {
    final GetPage<dynamic> screenOnePage = GetPage<dynamic>(
      name: screenOne,
      page: ScreenOne.new,
      binding: ScreenOneBinding(),
    );
    final GetPage<dynamic> screenTwoPage = GetPage<dynamic>(
      name: screenTwo,
      page: ScreenTwo.new,
      binding: ScreenTwoBinding(),
    );

    return <GetPage<dynamic>>[screenOnePage, screenTwoPage];
  }
}
