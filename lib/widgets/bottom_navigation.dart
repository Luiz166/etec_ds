import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final Function(int index) onPressed;
  const BottomNavigation({super.key, required this.onPressed});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  static const List<Widget> buttons = [
    Button(icon: Icons.home),
    Button(icon: Icons.menu_book),
    Button(icon: Icons.question_mark)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.purple[100]),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        for (var btn in buttons)
          GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                widget.onPressed(buttons.indexOf(btn));
              },
              child: Container(padding: const EdgeInsets.all(20), child: btn))
      ]),
    );
  }
}

class Button extends StatelessWidget {
  final IconData icon;

  const Button({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(icon);
  }
}
