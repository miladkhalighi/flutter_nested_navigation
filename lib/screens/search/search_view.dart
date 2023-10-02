import 'package:flutter/material.dart';
import 'package:nested_navigation/routes/route_names.dart';
import 'package:nested_navigation/routes/route_transition.dart';
import 'package:nested_navigation/screens/search/search_details.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Search Root'),
            ElevatedButton(
                onPressed: () {
                  //Navigator.pushNamed(context, RouteNames.searchDetails);
                  Navigator.push(
                      context,
                      EnterExitRoute(
                          exitPage: this, enterPage: const SearchDetails()));
                  
                },
                child: const Text("Go to search details"))
          ],
        ),
      ),
    );
  }
}
