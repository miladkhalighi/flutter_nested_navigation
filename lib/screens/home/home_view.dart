import 'package:flutter/material.dart';

import '../../routes/route_names.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Home Root'),
            ElevatedButton(
                onPressed: () {
                  //Navigator.pushNamed(context, RouteNames.homeDetails);
                  Navigator.of(context,rootNavigator: false).pushNamed(RouteNames.homeDetails);
                },
                child: const Text("Go to home details")),
          ],
        ),
      ),
    );
  }
}
