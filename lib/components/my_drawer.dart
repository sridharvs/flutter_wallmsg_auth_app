import 'package:flutter/material.dart';

class MYDrawer extends StatelessWidget {
  const MYDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
