import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_tasks/utils/utils.dart';

class MainScreen extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;
  const MainScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig.init(context);
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(index),
        iconSize: 20,
        elevation: 5,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Incomplete',
            icon: Icon(Icons.dangerous_outlined),
            activeIcon: Icon(Icons.dangerous),
          ),
          BottomNavigationBarItem(
            label: 'Add',
            icon: Icon(Icons.add),
            activeIcon: Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            label: 'Complete',
            icon: Icon(Icons.check_box_outlined),
            activeIcon: Icon(Icons.check_box),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(Icons.person_outlined),
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
