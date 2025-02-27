import 'package:flutter/material.dart';

import '../presentation/detail_screen.dart';

class BuildBottomNavBar extends StatefulWidget {
  const BuildBottomNavBar({super.key});

  @override
  State<BuildBottomNavBar> createState() => _BuildBottomNavBarState();
}

class _BuildBottomNavBarState extends State<BuildBottomNavBar> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0, left: 64.0, right: 64.0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(60),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _selectedIndex == 0
                        ? const Color.fromARGB(255, 255, 156, 17)
                        : Colors.black),
                child: IconButton(
                  icon: const Icon(Icons.search_rounded, color: Colors.white),
                  onPressed: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder: (_, __, ___) =>
                          DetailScreen(index: _selectedIndex),
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _selectedIndex == 1
                      ? const Color.fromARGB(255, 255, 156, 17)
                      : Colors.black),
              child: IconButton(
                icon: const Icon(Icons.message, color: Colors.white),
                onPressed: () => _onItemTapped(1),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _selectedIndex == 2
                      ? const Color.fromARGB(255, 255, 156, 17)
                      : Colors.black),
              child: IconButton(
                  icon: const Icon(Icons.home, color: Colors.white),
                  onPressed: () => _onItemTapped(2)),
            ),
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _selectedIndex == 3
                      ? const Color.fromARGB(255, 255, 156, 17)
                      : Colors.black),
              child: IconButton(
                icon: const Icon(Icons.favorite, color: Colors.white),
                onPressed: () => _onItemTapped(3),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _selectedIndex == 4
                      ? const Color.fromARGB(255, 255, 156, 17)
                      : Colors.black),
              child: IconButton(
                icon: const Icon(Icons.person, color: Colors.white),
                onPressed: () => _onItemTapped(4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
