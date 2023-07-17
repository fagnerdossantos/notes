import 'objectbox.g.dart';

final class ObjectboxDatabase {
  Store? _store;

  Future<Store> getStore() async => _store ??= await openStore();
}
