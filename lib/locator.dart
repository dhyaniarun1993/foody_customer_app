import 'package:get_it/get_it.dart';

import 'package:foody_customer_app/data/local_key_value_persistence.dart';

GetIt locator = GetIt();

void setupLocator() {
  var localStorageInstance = LocalKeyValuePersistence.getInstance();
  locator.registerSingleton<LocalKeyValuePersistence>(localStorageInstance);
}