import 'dart:async';

class Bloc {
  final themecontroller = StreamController<bool>();
  get changeTheme => themecontroller.sink.add;
  get darkThemeEnabled => themecontroller.stream;
}

final bloc = Bloc();