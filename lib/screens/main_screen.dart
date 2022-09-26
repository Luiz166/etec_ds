import 'package:animations/animations.dart';
import 'package:etec_ds/screens/faq_screen.dart';
import 'package:etec_ds/screens/home_screen.dart';
import 'package:etec_ds/screens/materias_screen.dart';
import 'package:etec_ds/utils/app_colors.dart';
import 'package:etec_ds/utils/utils.dart';
import 'package:etec_ds/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    MateriasScreen(),
    FAQScreen()
  ];

  void _onItemTapped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusBarColor(AppColors.primary);
    return Scaffold(
      body: SafeArea(
        child: PageTransitionSwitcher(
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
                FadeThroughTransition(
                    animation: primaryAnimation,
                    secondaryAnimation: secondaryAnimation,
                    child: child),
            child: _pages.elementAt(_selectedIndex)),
      ),
      bottomNavigationBar: BottomNavigation(
        onPressed: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
