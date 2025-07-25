import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:makerere_app/screens/home.dart";
import "package:makerere_app/screens/presentation_list.dart";
import "package:makerere_app/screens/schedule.dart";
import "package:makerere_app/screens/add_survey.dart";
import "package:makerere_app/screens/list_surveys.dart";

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  String? _userRole;
  bool _isLoading = true;

  late Widget _homeCurrentWidget;

  @override
  void initState() {
    super.initState();
    _homeCurrentWidget = HomeScreen(
      onNavigate: (Widget newScreen) {
        setState(() {
          _homeCurrentWidget = newScreen;
        });
      },
    );
    _fetchUserRole();
  }

  /*   Future<void> _fetchUserRole() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        setState(() {
          _userRole = userDoc['role'];
          _isLoading = false;
        });
      } else {
        setState(() {
          _userRole = null;
          _isLoading = false;
        });
        // Handle user doc not existing if needed.
      }
    }
  } */

  Future<void> _fetchUserRole() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (!mounted) return; // prevent calling setState if widget is disposed

      if (userDoc.exists) {
        setState(() {
          _userRole = userDoc['role'];
          _isLoading = false;
        });
      } else {
        setState(() {
          _userRole = null;
          _isLoading = false;
        });
      }
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      // If the user taps the Home tab, reset to the original HomeScreen if we're not already showing it.
      if (_selectedPageIndex == 0 && _homeCurrentWidget is! HomeScreen) {
        _homeCurrentWidget = HomeScreen(
          onNavigate: (Widget newScreen) {
            setState(() {
              _homeCurrentWidget = newScreen;
            });
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage;
    Widget activePageTitle;

    bool isHomeTab = (_selectedPageIndex == 0);

    if (isHomeTab) {
      activePage = _homeCurrentWidget;

      // Determine title and whether we need a back button.
      if (_homeCurrentWidget is HomeScreen) {
        activePageTitle = const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Makerere University", style: TextStyle(color: Colors.white)),
            Text(
              "Department of Medicine",
              style: TextStyle(color: Colors.white),
            ),
          ],
        );
      } else {
        // If we're not on the main HomeScreen, adjust the title based on the current widget.
        if (_homeCurrentWidget is ListSurveysScreen) {
          activePageTitle = const Text(
            "My Reviews",
            style: TextStyle(color: Colors.white),
          );
        } else if (_homeCurrentWidget is AddSurveyScreen) {
          activePageTitle = const Text(
            "Add Student Review",
            style: TextStyle(color: Colors.white),
          );
        } else {
          activePageTitle = const Text(
            "Makerere University",
            style: TextStyle(color: Colors.white),
          );
        }
      }
    } else if (_selectedPageIndex == 1) {
      activePage = const PresentationListScreen();
      activePageTitle = const Text(
        "Presentation Materials",
        style: TextStyle(color: Colors.white),
      );
    } else {
      // _selectedPageIndex == 2
      activePage = const ScheduleScreen();
      activePageTitle = const Text(
        "Schedule",
        style: TextStyle(color: Colors.white),
      );
    }

    // Determine if we should show a back button: Only show it on the Home tab if we're not on the initial HomeScreen.
    Widget? leadingWidget;
    if (isHomeTab && _homeCurrentWidget is! HomeScreen) {
      leadingWidget = IconButton(
        icon: const Icon(Icons.arrow_back),
        color: Colors.white,
        onPressed: () {
          setState(() {
            _homeCurrentWidget = HomeScreen(
              onNavigate: (Widget newScreen) {
                setState(() {
                  _homeCurrentWidget = newScreen;
                });
              },
            );
          });
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: leadingWidget,
        title: activePageTitle,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.white,
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : activePage,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(0, 166, 81, 1.0),
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
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
