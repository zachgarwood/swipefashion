library stack;

import 'package:angular/angular.dart';
import 'package:swipefashion/item.dart';
import 'package:swipefashion/user.dart';
import 'package:swipefashion/browser_window.dart';
import 'package:swipefashion/piss.dart';

@Component(
  selector: 'stack',
  templateUrl: 'stack.html'
)
class StackComponent {
  List<Item> items;
  final User user;
  final BrowserWindow browserWindow;
  final PissService piss;

  StackComponent(PissService this.piss, User this.user, BrowserWindow this.browserWindow) {
    _getItems();
  }

  Item get currentItem => items.first;

  void pass() {
    piss.addToViewedList(currentItem, user);
    _getNextItem();
  }

  void like() {
    _addToLikeList(currentItem);
    piss.addToViewedList(currentItem, user);
    _getNextItem();
  }

  void view() {
    browserWindow.open(currentItem.url, currentItem.name.toLowerCase()..replaceAll(new RegExp(r'\w'), ''));
  }


  _addToLikeList(Item item) {
  }

  void _getItems() {
    piss.getItems().then((items) => this.items = items);
  }

  void _getNextItem() {
    items.remove(currentItem);
    if (items.isEmpty) {
      _getItems();
    }
  }
}
