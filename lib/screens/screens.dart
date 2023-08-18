import 'package:flutter/material.dart';
import 'package:my_new_app/data/data.dart';
import 'package:my_new_app/screens/Menu_screen.dart';
import 'package:my_new_app/screens/friends_screen.dart';
import 'package:my_new_app/screens/home_screen.dart';
import 'package:my_new_app/screens/notification_screen.dart';
import 'package:my_new_app/screens/user_screen.dart';
import 'package:my_new_app/screens/video_screen.dart';
import 'package:my_new_app/theme_notifier.dart';
import 'package:my_new_app/widgets/custom_app_bar.dart';
import 'package:my_new_app/widgets/custom_tab_bar.dart';
import 'package:my_new_app/widgets/responsive.dart';
import 'package:provider/provider.dart';


class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  late ThemeNotifier themeNotifier; 

   @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    themeNotifier = Provider.of<ThemeNotifier>(context); // Initialize themeNotifier
  }

  
  final List<Widget> _screens = [
    HomeScreen(),
    VideoScreen(),
    const UserScreen(),
    const FriendScreen(),
    const NotificationScreen(),
    const MenuScreen(),
  ];


  List<IconData> get _icons => themeNotifier.isDarkMode
      ? [
          Icons.home,
          Icons.ondemand_video,
          Icons.group_outlined,
          Icons.person_outline,
          Icons.notifications_none_outlined,
          Icons.menu,
        ]
      : [
         
          Icons.home_filled,
          Icons.ondemand_video,
          Icons.group,
          Icons.person,
          Icons.notifications,
          Icons.menu,
        ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context)
            ? PreferredSize(
                preferredSize: Size(screenSize.width, 100.0),
                child: CustomAppBar(
                  currentUser: currentUser,
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                   onTap: (index) => setState(() => _selectedIndex = index),
                ),
              )
            : null,
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: !Responsive.isDesktop(context)
            ? Container(
                padding: const EdgeInsets.only(bottom: 12.0),
                color: themeNotifier.isDarkMode ? Colors.black45 : Colors.white,
                child: CustomTabBar(
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                ),
              )
            : const SizedBox.shrink(),
      ),

      
    );
  }
}
