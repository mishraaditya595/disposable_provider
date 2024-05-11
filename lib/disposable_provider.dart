library disposable_provider;
import 'package:flutter/cupertino.dart';

abstract class DisposableProvider with ChangeNotifier {
  void disposeValues();
}

class AppProviders {
  static final List<DisposableProvider> _disposableProviderList = [];

  static void addProvidersToDispose({required DisposableProvider provider}) {
    _disposableProviderList.add(provider);
  }


  static List<DisposableProvider> _getDisposableProviders(BuildContext context) {
    return _disposableProviderList;
  }

  static void disposeAllDisposableProviders({required BuildContext context}) {
    List<DisposableProvider> disposableProviderList = _getDisposableProviders(context);
    for(DisposableProvider disposableProvider in disposableProviderList) {
      disposableProvider.disposeValues();
    }
  }
}