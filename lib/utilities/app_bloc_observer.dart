import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlockObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print(change);

    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    print(bloc);

    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
  }
}
