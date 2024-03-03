import 'package:back_to_the_future/ui/first_page.dart';
import 'package:back_to_the_future/ui/second_page.dart';
import 'package:back_to_the_future/ui/third_page.dart';
import 'package:flutter/material.dart';

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
