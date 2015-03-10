library swipefashion;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:swipefashion/stack.dart';
import 'package:swipefashion/user.dart';
import 'package:swipefashion/browser_window.dart';
import 'package:swipefashion/piss.dart';

class AppModule extends Module {
  AppModule() {
    bind(PissService);
    bind(BrowserWindow);
    bind(User);
    bind(StackComponent);
  }
}

void main() {
  applicationFactory()
    .addModule(new AppModule())
    .run();
}
