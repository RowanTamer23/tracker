import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracker/main.dart';

class ThemeDropdown extends StatefulWidget {
  const ThemeDropdown({super.key});

  @override
  State<ThemeDropdown> createState() => _ThemeDropdownState();
}

class _ThemeDropdownState extends State<ThemeDropdown> {
  String selectedTheme = 'System'; // default option

  @override
  void initState() {
    super.initState();
    _loadSavedTheme();
  }

  Future<void> _loadSavedTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString('themeMode') ?? 'system';
    setState(() {
      selectedTheme = saved[0].toUpperCase() + saved.substring(1);
    });
  }

  Future<void> _saveTheme(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeMode', value.toLowerCase());
  }

  bool get isLightMode => Theme.of(context).brightness == Brightness.light;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedTheme,
      isExpanded: true,
      underline: const SizedBox(),
      icon: const Icon(Icons.arrow_drop_down),
      items: [
        DropdownMenuItem(
          value: 'System',
          child: Row(
            children: [
              Icon(Icons.settings,
                  color: isLightMode
                      ? KColorScheme.onPrimaryContainer
                      : KColorSchemeDark.onPrimaryContainer),
              SizedBox(width: 8),
              Text('System Theme'),
            ],
          ),
        ),
        DropdownMenuItem(
          value: 'Light',
          child: Row(
            children: [
              Icon(Icons.light_mode,
                  color: isLightMode
                      ? KColorScheme.onPrimaryContainer
                      : KColorSchemeDark.onPrimaryContainer),
              SizedBox(width: 8),
              Text('Light'),
            ],
          ),
        ),
        DropdownMenuItem(
          value: 'Dark',
          child: Row(
            children: [
              Icon(Icons.dark_mode,
                  color: isLightMode
                      ? KColorScheme.onPrimaryContainer
                      : KColorSchemeDark.onPrimaryContainer),
              SizedBox(width: 8),
              Text('Dark'),
            ],
          ),
        ),
      ],
      onChanged: (value) {
        setState(() {
          selectedTheme = value!;
        });

        final appState = MyApp.of(context);

        // Apply the selected theme
        if (value == 'Light') {
          appState?.setThemeMode(ThemeMode.light);
          selectedTheme = value!;
        } else if (value == 'Dark') {
          appState?.setThemeMode(ThemeMode.dark);
          selectedTheme = value!;
        } else {
          appState?.setThemeMode(ThemeMode.system);
          selectedTheme = value!;
        }
      },
    );
  }
}
