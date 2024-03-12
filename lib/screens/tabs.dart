import "package:flutter/material.dart";
import "package:makerere_app/screens/home.dart";
import "package:makerere_app/screens/orientation.dart";
import "package:makerere_app/screens/schedule.dart";

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const HomeScreen();
    Widget activePageTitle = const Column(
      children: [
        Text(
          "Makerere University",
          style: TextStyle(color: Colors.white),
        ),
        Text(
          "School of Medicine",
          style: TextStyle(color: Colors.white),
        ),
      ],
    );

    if (_selectedPageIndex == 1) {
      activePage = const OrientationScreen();
      activePageTitle = const Text(
        "Orientation Materials",
        style: TextStyle(color: Colors.white),
      );
    } else if (_selectedPageIndex == 2) {
      activePage = const ScheduleScreen();
      activePageTitle = const Text(
        "Schedule",
        style: TextStyle(color: Colors.white),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: activePageTitle,
        backgroundColor: Colors.black,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(0, 153, 0, 50),
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: "Orientation",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: "Schedule",
          ),
        ],
      ),
    );
  }
}
