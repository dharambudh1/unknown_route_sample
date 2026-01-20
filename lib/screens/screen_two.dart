import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:unknown_route_sample/controllers/screen_two_controller.dart";
import "package:unknown_route_sample/services/route_service.dart";

class ScreenTwo extends GetView<ScreenTwoController> {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen Two")),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              // Intentionally navigating to an unknown route
              const String routeName = "/someUnknownRoute";
              final Map<String, dynamic> arguments = <String, dynamic>{};

              await RouteService().pushNamed(routeName, arguments: arguments);
            },
            child: const Text("Go to Unknown Route"),
          ),
        ),
      ),
    );
  }
}
