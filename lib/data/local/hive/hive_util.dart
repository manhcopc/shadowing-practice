import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@singleton
class HiveUtils {
  HiveUtils();

  static const favoritesBoxName = 'favorites_positions';
  static const triedBoxName     = 'tried_positions';      

  bool _inited = false;

  Future<void> initialize() async {
    if (_inited) return;
    await _openBoxes();
    _inited = true;
  }

  Future<void> _openBoxes() async {
    await Hive.openBox<Map>(favoritesBoxName);
    await Hive.openBox<Map>(triedBoxName);               
  }

  Box<T> box<T>(String name) => Hive.box<T>(name);
  Future<bool> exists(String name) => Hive.boxExists(name);

  Box<Map> get favoritesBox => box<Map>(favoritesBoxName);
  Box<Map> get triedBox     => box<Map>(triedBoxName);    
}
