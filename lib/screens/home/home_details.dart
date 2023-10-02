import 'package:flutter/material.dart';
import '../../routes/route_names.dart';

class HomeDetailsView extends StatelessWidget {
  const HomeDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("home details"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.homeInner);
                },
                child: const Text("go to home inner")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("back"))
          ],
        ),
      ),
    );
  }
}
