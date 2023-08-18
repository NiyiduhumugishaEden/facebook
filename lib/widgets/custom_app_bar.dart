import 'package:flutter/material.dart';
import 'package:my_new_app/config/palette.dart';
import 'package:my_new_app/models/user_model.dart';
import 'package:my_new_app/theme_notifier.dart';
import 'package:my_new_app/widgets/custom_tab_bar.dart';
import 'package:my_new_app/widgets/user_card.dart';
import 'package:provider/provider.dart';

import 'circle_button.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomAppBar({
    Key? key,
    required this.currentUser,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      decoration: BoxDecoration(
       color: themeNotifier.isDarkMode ? Colors.black : Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'facebook',
              style: const TextStyle(
                color: Palette.facebookBlue,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: 600.0,
            child: CustomTabBar(
              icons: icons,
              selectedIndex: selectedIndex,
              onTap: onTap,
              isBottomIndicator: true,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UserCard(user: currentUser),
                const SizedBox(width: 12.0),
                CircleButton(
                  key: UniqueKey(), 
                  icon: Icons.search,
                  iconSize: 20.0,
                  onPressed: () => print('Search'),
                ),
                CircleButton(
                  key: UniqueKey(), 
                  icon: Icons.email,
                  iconSize: 20.0,
                  onPressed: () => print('Messenger'),
                ),

   Container(
       decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.black45,
  ),
  child: ElevatedButton(
    onPressed: () {
      final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
      themeNotifier.toggleTheme();
    },
    child: Icon(Icons.brightness_4_outlined, size: 20.0, color: Colors.white),
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.all(10.0), // Adjust the padding as needed
      shape: CircleBorder(),
      elevation: 0, // Remove button elevation
    ),
  ),
),

              ],
            ),
          ),
        ],
      ),
    );
  }
}





