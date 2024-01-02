import 'package:flutter/material.dart';


class WhiteAppbarwithIcon extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final String title;
  final bool centerTitle;
  final Widget? leading;
  final List<Widget> actions;

  WhiteAppbarwithIcon({
    Key? key,
    required this.backgroundColor,
    required this.title,
    required this.centerTitle,
    this.leading,
    this.actions = const [],
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(title),
      centerTitle: centerTitle,
      leading: leading,
      actions: actions,
    );
  }
}