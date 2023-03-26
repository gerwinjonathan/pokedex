import 'package:flutter/material.dart';

class BottomNavHomeWidget extends StatelessWidget {
  const BottomNavHomeWidget({super.key, required this.items});
  final List<BottomNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: items,
    );
  }
}
