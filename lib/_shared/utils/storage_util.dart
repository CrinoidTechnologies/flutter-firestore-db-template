import 'package:flutter/foundation.dart';

/// Persistent data helper class,
/// makes data read operation synchronous

class StorageUtil {
  final _storage;

  StorageUtil(this._storage);

  Future write(dynamic key, value) async {
    return await _storage.write("$key", value);
  }

  T? read<T>(dynamic key) {
    return _storage.read<T>(key.toString());
  }

  bool? readBool(dynamic key) {
    return _storage.read<bool>(key.toString());
  }

  int? readInt(dynamic key) {
    return _storage.read<int>(key.toString());
  }

  String? readString(dynamic key) {
    return _storage.read<String>(key.toString());
  }

  void remove(int key) {
    try {
      storage.remove(key.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  get storage => _storage;
}
