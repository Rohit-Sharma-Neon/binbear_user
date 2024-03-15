import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

class BaseStorage{
  static GetStorage box = GetStorage('MyStorage');

  static void write(String key, dynamic value, {bool? showLog}) {
    if (showLog??true) {
      Logger().i('key: $key, Value: $value');
    }
    box.write(key, value);
  }

  static dynamic read(String key, {bool? showLog}) {
    dynamic returnValue = box.read(key);
    if (showLog??true) {
      Logger().i('key: $key, Value: $returnValue');
    }
    return returnValue;
  }

  static void remove(String key, {bool? showLog}) {
    if (showLog??true) {
      Logger().i('key: $key');
    }
    box.remove(key);
  }
}