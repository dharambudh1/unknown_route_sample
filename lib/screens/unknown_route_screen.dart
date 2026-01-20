import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:unknown_route_sample/controllers/unknown_route_controller.dart";
import "package:unknown_route_sample/services/route_service.dart";

class UnknownRouteScreen extends GetView<UnknownRouteController> {
  const UnknownRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Unknown Route")),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Display message for unknown route
              const Text("The route you are trying to access does not exist."),

              const SizedBox(height: 16),

              // Go back to the previous screen
              ElevatedButton(
                onPressed: RouteService().pop,
                child: const Text("Go Back"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
