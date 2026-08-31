import 'package:flutter/material.dart';
import 'package:local_brand/api/auth_service.dart';
import 'package:local_brand/core/theme/app_spacing.dart';
import 'package:local_brand/core/widgets/nav_bar.dart';
import 'package:local_brand/core/widgets/nav_item.dart';
import 'package:local_brand/pages/screens.dart';

import 'core/routing/routes.dart';
import 'core/widgets/app_bar.dart';

/*
This file has the essiental pages I should add, it's the main scaffold where I wire the other pages with

- The pages list has the instance of the screens
- The list is the button that appear at the bottom navbar
- a drawer so I can navigate to pages or logout
*/
class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _selectedIndex = 0;
  final _auth = AuthService.instance;
  final List<Widget> _pages = const [
    HomeScreen(),
    CartScreen(),
    FavoritesScreen(),
    Placeholder(),
  ];
  void onPressedCart() {
    setState(() => _selectedIndex = 1,);
  }

  void showPersonDialog() {
    final user = _auth.currentUser;
    final name = user?.displayName?.isNotEmpty == true
        ? user!.displayName!
        : 'User';
    final email = user?.email ?? 'No email';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Hello, $name'),
        content: Text(email),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmSignout() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign out'),
        content: Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Sign out'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await _auth.signOut();
      // No manual navigation: the auth stream in main.dart sends us to Login.
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final List<Widget> list = [
      KayanNavItem(
        icon: Icons.home_outlined,
        isSelected: _selectedIndex == 0,
        onTap: () => setState(() => _selectedIndex = 0),
      ),
      KayanNavItem(
        icon: Icons.shopping_bag_outlined,
        isSelected: _selectedIndex == 1,
        onTap: () => setState(() => _selectedIndex = 1),
      ),
      KayanNavItem(
        icon: Icons.favorite_outline,
        isSelected: _selectedIndex == 2,
        onTap: () => setState(() => _selectedIndex = 2),
      ),
      KayanNavItem(
        icon: Icons.person_outline,
        isSelected: _selectedIndex == 3,
        onTap: () => setState(() => _selectedIndex = 3),
      ),
    ];

    return Scaffold(
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: KayanAppBar(
          textTheme: textTheme,
          onPressedPerson: showPersonDialog,
          onPressedCart: onPressedCart,
        ),
      ),

      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: KayanGlassNavigationBar(items: list),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorTheme.primary,
        child: Icon(Icons.add, color: colorTheme.onPrimary),
        onPressed: () => Navigator.pushNamed(context, Routes.addProduct),
      ),

      drawer: Drawer(
        backgroundColor: colorTheme.secondaryContainer,
        child: Container(
          padding: EdgeInsets.all(KayanSpacing.md),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: _confirmSignout,
                  child: Text('Logout'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
