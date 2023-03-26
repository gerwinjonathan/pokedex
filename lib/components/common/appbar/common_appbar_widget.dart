import 'package:flutter/material.dart';

class CommonAppBarWidget extends StatelessWidget {
  const CommonAppBarWidget(
      {super.key,
      required this.title,
      this.automaticallyImplyLeading = true,
      this.actions});
  final String title;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: Text(title),
      actions: actions,
    );
  }
}
