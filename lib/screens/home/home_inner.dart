import 'package:flutter/material.dart';

class HomeInner extends StatelessWidget {
  const HomeInner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("home inner"),
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
