import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'splash_store.g.dart';

class SplashStore = SplashStoreBase with _$SplashStore;

abstract class SplashStoreBase with Store implements Disposable {
  @observable
  bool isLoading = false;

  @action
  Future<void> dismiss() async {
    await Future.delayed(const Duration(seconds: 2));

    Modular.to.navigate('/home/');
  }

  @action
  void wipeStore() {
    isLoading = false;
  }

  @override
  void dispose() => wipeStore();
}
