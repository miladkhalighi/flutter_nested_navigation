import 'package:flutter/material.dart';
import 'package:nested_navigation/routes/route_names.dart';
import 'package:nested_navigation/routes/tab_navigator.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _currentIndex = 0;
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  final List<String> _tabItems = [
    RouteNames.home,
    RouteNames.search,
    RouteNames.profile
  ];

  @override
  Widget build(BuildContext context) {
    //* onWillPopScope will take care of back button on android devices
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Nested navigations"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: _body(),
        ),
        bottomNavigationBar: _bottomNavBar(),
      ),
    );
  }

  Stack _body() {
    //!  If you have a small number of simple tabs, IndexedStack might offer faster tab switching.
    //! If you have many tabs or complex widgets,
    //! Offstage may provide better memory efficiency at the cost of slightly slower tab switching.
    return Stack(
      children: _navigatorKeys.map((key) {
        final index = _navigatorKeys.indexOf(key);
        return Offstage(
          offstage: _currentIndex != index,
          child: TabNavigator(
            navigatorKey: key,
            tabItem: _tabItems[index],
          ),
        );
      }).toList(),
    );
  }

  BottomNavigationBar _bottomNavBar() {
    return BottomNavigationBar(
        onTap: (index) {
          if (index == _currentIndex) {
            // Pop to first route in the current tab
            _navigatorKeys[index]
                .currentState
                ?.popUntil((route) => route.isFirst);
          } else {
            // Update the index and thus switch tab
            setState(() => _currentIndex = index);
          }
        },
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "profile",
          ),
        ]);
  }

  Future<bool> _onWillPop() {
    final currentState = _navigatorKeys[_currentIndex].currentState;
    if (currentState != null && currentState.canPop()) {
      currentState.pop(); // Pop the current route
      return Future.value(false); // Prevent the app from exiting
    }
    if (_currentIndex == 0) {
      return Future.value(true); // Allow the app to exit
    } else {
      setState(() {
        _currentIndex--; // Decrement the current index to switch tabs
      });
      return Future.value(false); // Prevent the app from exiting
    }
  }
}
