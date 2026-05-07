import 'package:flutter/material.dart';
import 'package:ludoboardgames/ui/components/app_logo.dart';

class LudoBGTopBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;

  const LudoBGTopBar({super.key, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      title: const AppLogo(),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
