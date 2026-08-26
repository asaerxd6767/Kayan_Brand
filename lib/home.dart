import 'package:flutter/material.dart';
import 'package:local_brand/core/widgets/nav_bar.dart';
import 'package:local_brand/core/widgets/nav_item.dart';
import 'package:local_brand/pages/home_screen.dart';

import 'core/routing/routes.dart';
import 'core/widgets/app_bar.dart';

/*
This file has the essiental pages I should add, it's the main scaffold where I wire the other pages with

- The pages list has the instance of the screens
- The list is the button that appear at the bottom navbar
*/
class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [HomeScreen(), const Placeholder()];
  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final List<Widget> list = [
      // home
      KayanNavItem(
        icon: Icons.home_outlined,
        isSelected: _selectedIndex == 0,
        onTap: () => setState(() => _selectedIndex = 0),
      ),

      // profile
      KayanNavItem(
        icon: Icons.person_outline,
        isSelected: _selectedIndex == 1,
        onTap: () => setState(() => _selectedIndex = 1),
      ),
    ];

    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: KayanAppBar(textTheme: textTheme),
      ),

      body: _pages[_selectedIndex],

      bottomNavigationBar: KayanGlassNavigationBar(items: list),
      floatingActionButton: FloatingActionButton(
    backgroundColor: colorTheme.primary,
    child:  Icon(Icons.add, color: colorTheme.onPrimary),
    onPressed: () {
      Navigator.pushNamed(context, Routes.addProduct);
    },
  ),
    );
  }
}
