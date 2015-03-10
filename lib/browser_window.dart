library browser_window;

import 'dart:html';
import 'package:angular/angular.dart';

@Injectable()
class BrowserWindow {
  open(url, target) {
    window.open(url, target);
  }
}