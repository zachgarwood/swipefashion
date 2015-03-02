library stack;

import 'dart:convert';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:swipefashion/item.dart';
import 'package:swipefashion/user.dart';

@Component(
  selector: 'stack',
  templateUrl: 'stack.html'
)
class StackComponent {
  bool itemsLoaded = false;
  final Http http;
  List<Item> items;
  static const String url = 'http://private-75680-swipefashion.apiary-mock.com';
  final User user;

  StackComponent(Http this.http, User this.user) {
    _getItems();
  }

  Item get currentItem => items.first;

  void pass() {
    _addToViewedList(currentItem);
    _getNextItem();
  }

  void like() {
    _addToLikeList(currentItem);
    _addToViewedList(currentItem);
    _getNextItem();
  }

  void view() {
    window.open(currentItem.url, currentItem.name.toLowerCase()..replaceAll(new RegExp(r'\w'), ''));
  }

  _addToViewedList(Item item) {
    JsonEncoder json = new JsonEncoder();
    http.post(url + '/items/${item.id}/view', json.convert(user))
      .catchError((error) {
        print(error);
      });
  }

  _addToLikeList(Item item) {
  }

  void _getNextItem() {
    items.remove(currentItem);
    if (items.isEmpty) {
      itemsLoaded = false;
      _getItems();
    }
  }

  void _getItems() {
    http.get(url + '/items')
      .then((HttpResponse response) {
        items = response.data.map((data) => new Item.fromJson(data)).toList();
        itemsLoaded = true;
      })
      .catchError((error) {
        print(error);
        items = new List();
      });
  }
}
