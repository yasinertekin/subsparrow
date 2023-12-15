part of '../profile_view.dart';

final class _ChangeThemeColorSwitchButton extends StatelessWidget {
  const _ChangeThemeColorSwitchButton();

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return ListTile(
          title: themeNotifier.getTheme() == CustomDarkTheme().themeData
              ? const Text('Karanlık Tema')
              : const Text('Aydınlık Tema'),
          trailing: SizedBox(
            width: context.sized.dynamicHeight(
              0.1,
            ), // Adjust the width as needed
            child: Switch(
              value: themeNotifier.getTheme() == CustomDarkTheme().themeData,
              onChanged: (value) {
                _changeTheme(value, themeNotifier);
              },
            ),
          ),
        );
      },
    );
  }

  void _changeTheme(bool value, ThemeNotifier themeNotifier) {
    if (value) {
      themeNotifier.setTheme(CustomDarkTheme().themeData);
    } else {
      themeNotifier.setTheme(CustomLightTheme().themeData);
    }
  }
}
