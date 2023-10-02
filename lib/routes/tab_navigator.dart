import 'package:flutter/material.dart';
import 'package:nested_navigation/routes/route_names.dart';
import 'package:nested_navigation/routes/route_transition.dart';
import 'package:nested_navigation/screens/error.dart';
import 'package:nested_navigation/screens/home/home_inner.dart';
import 'package:nested_navigation/screens/profile/profile_details.dart';
import 'package:nested_navigation/screens/profile/profile_view.dart';
import 'package:nested_navigation/screens/search/search_details.dart';
import 'package:nested_navigation/screens/search/search_view.dart';

import '../screens/home/home_details.dart';
import '../screens/home/home_view.dart';

class TabNavigator extends StatelessWidget {
  const TabNavigator(
      {required this.navigatorKey, required this.tabItem, Key? key})
      : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  //! custom transition
  Route createRoute(BuildContext context, Widget page) {
    final platform = Theme.of(context).platform;
    return platform == TargetPlatform.android
       ? androidTransition(context, page)
       : iosTransition(context, page);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: RouteNames.initial,
      onGenerateRoute: (routeSettings) {
        switch (routeSettings.name) {
          case RouteNames.initial:
            switch (tabItem) {
              case RouteNames.home:
                return MaterialPageRoute(
                    builder: (context) => const HomeView());
              case RouteNames.search:
                return MaterialPageRoute(
                    builder: (context) => const SearchView());
              case RouteNames.profile:
                return MaterialPageRoute(
                    builder: (context) => const ProfileView());
              default:
                return MaterialPageRoute(
                    builder: (context) =>
                        const ErrorView()); // Return an error view or some fallback
            }
          //other pages
          case RouteNames.homeDetails:
            //! we can return MateerialPageRoute or createRoute
            return createRoute(context, const HomeDetailsView());
          case RouteNames.homeInner:
            return MaterialPageRoute(builder: (context) => const HomeInner());
          case RouteNames.searchDetails:
            return MaterialPageRoute(
                builder: (context) => const SearchDetails());
          case RouteNames.profileDetails:
            return MaterialPageRoute(
                builder: (context) => const ProfileDetails());
          // ... add more case statements for other named routes
          default:
            return MaterialPageRoute(
                builder: (context) =>
                    const ErrorView()); // Return an error view or some fallback
        }
      },
    );
  }
}
