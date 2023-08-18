import 'package:flutter/material.dart';
import 'package:my_new_app/config/palette.dart';
import 'package:my_new_app/models/models.dart';
import 'package:my_new_app/models/user_model.dart';
import 'package:my_new_app/widgets/user_card.dart';

class MoreOptionsList extends StatelessWidget {
  final List<List> _moreOptionsList = const [
  [Icons.security, Colors.deepPurple, 'Security'],
  [Icons.people, Colors.cyan, 'Community'],
  [Icons.chat_bubble, Palette.facebookBlue, 'Chat'],
  [Icons.flag, Colors.orange, 'Flags'],
  [Icons.shopping_cart, Palette.facebookBlue, 'Shop'],
  [Icons.tv, Palette.facebookBlue, 'TV'],
  [Icons.calendar_today, Colors.red, 'Calendar'],
];

  final User currentUser;

   MoreOptionsList({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280.0),
      child: ListView.builder(
        itemCount: 1 + _moreOptionsList.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: UserCard(user: currentUser),
            );
          }
          final List option = _moreOptionsList[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: _Option(
              icon: option[0],
              color: option[1],
              label: option[2],
            ),
          );
        },
      ),
    );
  }
}

class _Option extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _Option({
    Key? key,
    required this.icon,
    required this.color,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(label),
      child: Row(
        children: [
          Icon(icon, size: 38.0, color: color),
          const SizedBox(width: 6.0),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(fontSize: 16.0),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
