import 'package:listinha/src/shared/services/models/configuration_model.dart';
import 'package:realm/realm.dart';

abstract class ConfigurationService {
  ConfigurationModel getConfiguration();
  void saveConfiguration(String themeMode, DateTime? syncDate);
  void deleteAll();
}

class ConfigurationServiceImpl implements ConfigurationService {
  final Realm realm;

  ConfigurationServiceImpl(this.realm);

  @override
  ConfigurationModel getConfiguration() {
    final config = realm.all<ConfigurationModel>().first;
    return config;
  }

  @override
  void deleteAll() {
    realm.deleteAll();
  }

  @override
  void saveConfiguration(String themeModeName, DateTime? syncDate) {
    final model = getConfiguration();
    realm.write(() {
      model.themeModeName = themeModeName;
      model.syncDate = syncDate;
    });
  }
}
