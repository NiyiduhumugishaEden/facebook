import 'package:flutter/material.dart';
import 'package:my_new_app/theme_notifier.dart';
import 'package:provider/provider.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Function onPressed;

  const CircleButton({
    required Key key,
    required this.icon,
    required this.iconSize,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: themeNotifier.isDarkMode ? Colors.white24 : Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon),
        iconSize: iconSize,
        color: Colors.black,
        onPressed: onPressed(),
      ),
    );
  }
}
