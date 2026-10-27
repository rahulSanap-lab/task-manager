
import 'package:flutter/material.dart';

class bar extends StatefulWidget {
  const bar({super.key});

  @override
  State<bar> createState() => _barState();
}

class _barState extends State<bar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      selectedItemColor: const Color(0xFF3478F6),
      unselectedItemColor: Colors.blueGrey,
      type: BottomNavigationBarType.fixed,

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.checklist),
          label: "Tasks",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: "profile",
        ),
      ],

      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });

        if (index == 1) {
          Navigator.pushNamed(context, "task");
        } else if (index == 2) {
          Navigator.pushNamed(context, "profile");
        }
      },
    );
  }
}
