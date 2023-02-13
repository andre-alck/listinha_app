import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/shared/stores/app_store.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  @override
  Widget build(BuildContext context) {
    final thememode = context.watch<AppStore>(
      (bind) => bind.theme,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('LISTINHA')),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Text(
              'Tema',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 30),
            RadioListTile(
              title: const Text('Sistema'),
              value: ThemeMode.system,
              groupValue: thememode.theme.value,
              onChanged: thememode.changeThemeMode,
            ),
            RadioListTile(
              title: const Text('Claro'),
              value: ThemeMode.light,
              groupValue: thememode.theme.value,
              onChanged: thememode.changeThemeMode,
            ),
            RadioListTile(
              title: const Text('Escuro'),
              value: ThemeMode.dark,
              groupValue: thememode.theme.value,
              onChanged: thememode.changeThemeMode,
            ),
            const SizedBox(height: 30),
            Text(
              'Controle de dados',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Apacar cache e reniciar o app'),
            )
          ],
        ),
      ),
    );
  }
}
