import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:unknown_route_sample/utils/routes_util.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Do not use "/" as initial route else unknown route handling won't work.
      initialRoute: RoutesUtil().screenOne,

      // Handle known routes...
      getPages: RoutesUtil().getPages,

      // Handle unknown routes...
      unknownRoute: RoutesUtil().getUnknownPage,

      debugShowCheckedModeBanner: false,
    );
  }
}
