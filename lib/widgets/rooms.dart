import 'package:flutter/material.dart';
import 'package:my_new_app/config/palette.dart';
import 'package:my_new_app/models/models.dart';
import 'package:my_new_app/theme_notifier.dart';
import 'package:my_new_app/widgets/profile_avatar.dart';
import 'package:my_new_app/widgets/responsive.dart';
import 'package:provider/provider.dart';


class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({
    Key? key,
    required this.onlineUsers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        height: 60.0,
        color: themeNotifier.isDarkMode ? Colors.black : Colors.white.withOpacity(0.6),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 4.0,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _CreateRoomButton(),
              );
            }
            final User user = onlineUsers[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
  onPressed: () => print('Create Room'),
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
      side: BorderSide(
        width: 3.0,
        color: Colors.blueAccent,
      ),
    ),
    primary: Colors.white,
    onPrimary: Palette.facebookBlue,
  ),
  child: Row(
    children: [
      Icon(
        Icons.video_call,
        size: 35.0,
        color: Colors.purple,
      ),
      const SizedBox(width: 4.0),
      Text('Create\nRoom'),
    ],
  ),
);

  }
}
