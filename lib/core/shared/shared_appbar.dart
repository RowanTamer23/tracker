import 'package:flutter/material.dart';
import 'package:tracker/main.dart';

class SharedAppBar extends StatefulWidget implements PreferredSizeWidget {
  final List<Widget>? actions;

  const SharedAppBar({this.actions});

  @override
  State<SharedAppBar> createState() => _SharedAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _SharedAppBarState extends State<SharedAppBar> {
  bool get isLightMode => Theme.of(context).brightness == Brightness.light;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: CircleAvatar(
          backgroundColor: isLightMode
              ? KColorScheme.primaryFixed
              : KColorSchemeDark.surfaceContainerHigh,
          radius: 23,
          child: Icon(Icons.person,
              size: 40,
              color: isLightMode
                  ? KColorScheme.secondary
                  : KColorSchemeDark.surfaceDim),
        ),
      ),
      title: Text(
        'Hello, Rowan!',
      ),
      actions: [
        TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.whatshot),
          label: Text('Streak'),
          style: ButtonStyle(
            splashFactory: NoSplash.splashFactory,
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            foregroundColor: isLightMode
                ? WidgetStateProperty.all(KColorScheme.onPrimaryContainer)
                : WidgetStateProperty.all(KColorSchemeDark.onSurfaceVariant),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications),
          style: ButtonStyle(
            splashFactory: NoSplash.splashFactory,
          ),
        ),
      ],
    );
  }
}
