library swipefashion;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:swipefashion/stack.dart';
import 'package:swipefashion/user.dart';

class AppModule extends Module {
    AppModule() {
        bind(User);
        bind(StackComponent);
    }
}

void main() {
    applicationFactory()
        .addModule(new AppModule())
        .run();
}
