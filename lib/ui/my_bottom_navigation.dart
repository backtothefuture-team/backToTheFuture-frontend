import 'package:flutter/material.dart';
import 'package:rest_api_ex/ui/second_page.dart';
import 'package:rest_api_ex/ui/third_page.dart';

import 'first_page.dart';

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({super.key});

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {

  int currentPage = 0;
  static const pages = [
    FirstPage(),
    SecondPage(),
    ThirdPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }


  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentPage,
      onTap: (index) => setState(() {
        currentPage = index;
      }),

      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'map'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'setting'),
      ],
    );
  }
}
