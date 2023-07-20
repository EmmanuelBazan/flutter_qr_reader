import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = 1;

    return BottomNavigationBar(
        currentIndex: currentIndex,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.compass_calibration), label: '')
        ]);
  }
}
