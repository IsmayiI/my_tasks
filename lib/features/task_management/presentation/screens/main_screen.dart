import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_tasks/features/authentication/presentation/screens/accounts_screen.dart';

import 'screens.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _tabController.index = currentIndex;

    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: const [
          AllTaskScreen(),
          InCompleteTasksScreen(),
          AddTaskScreen(),
          CompletedTasksScreen(),
          AccountsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) => setState(() => currentIndex = value),
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

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
