import 'package:flutter/material.dart';
import 'package:nested_navigation/routes/route_names.dart';

import '../screens/home/home_details.dart';
import '../screens/home/home_inner.dart';
import '../screens/profile/profile_details.dart';
import '../screens/profile/profile_view.dart';
import '../screens/search/search_details.dart';
import '../screens/search/search_view.dart';
import '../screens/splash.dart';
import '../main_wrapper.dart';

class AppRoutes {
  AppRoutes._();
  static Map<String, Widget Function(BuildContext)> routes = {
    RouteNames.initial: (context) => const SplashScreen(),
    RouteNames.mainWrapper: (context) => const MainWrapper(),
    RouteNames.homeDetails: (context) => const HomeDetailsView(),
    RouteNames.homeInner: (context) => const HomeInner(),
    RouteNames.search: (context) => const SearchView(),
    RouteNames.searchDetails: (context) => const SearchDetails(),
    RouteNames.profile: (context) => const ProfileView(),
    RouteNames.profileDetails: (context) => const ProfileDetails(),
  };
}
