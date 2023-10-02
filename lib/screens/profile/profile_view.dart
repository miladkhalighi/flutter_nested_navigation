import 'package:flutter/material.dart';
import 'package:nested_navigation/routes/route_names.dart';
import 'package:nested_navigation/routes/route_transition.dart';
import 'package:nested_navigation/screens/profile/profile_details.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Profile Root'),
            ElevatedButton(
                onPressed: () {
                  //Navigator.pushNamed(context, RouteNames.profileDetails);
                  Navigator.push(
                      context, androidTransition(context, const ProfileDetails()));
                },
                child: const Text("Go to profile details"))
          ],
        ),
      ),
    );
  }
}
