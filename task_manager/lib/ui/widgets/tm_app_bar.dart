import 'package:flutter/material.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: Row(
        spacing: 8,
        children: [
          CircleAvatar(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Full name',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(color: Colors.white),
              ),
              Text(
                'email@gmail.com',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
