import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:unknown_route_sample/controllers/screen_one_controller.dart";
import "package:unknown_route_sample/services/route_service.dart";
import "package:unknown_route_sample/utils/routes_util.dart";

class ScreenOne extends GetView<ScreenOneController> {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen One")),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              final String routeName = RoutesUtil().screenTwo;
              final Map<String, dynamic> arguments = <String, dynamic>{};

              await RouteService().pushNamed(routeName, arguments: arguments);
            },
            child: const Text("Go to Screen Two"),
          ),
        ),
      ),
    );
  }
}
