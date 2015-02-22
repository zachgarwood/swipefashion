library stack;

import 'dart:html';
import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:swipefashion/item.dart';
import 'package:swipefashion/user.dart';

@Component(
    selector: 'stack',
    templateUrl: 'stack.html'
)
class StackComponent {
    bool itemsLoaded = false;
    final Http _http;
    List<Item> _items;
    static const String _url = 'http://private-75680-swipefashion.apiary-mock.com';
    final User _user;

    StackComponent(Http this._http, User this._user) {
        _getItems();
    }

    Item get currentItem => _items.first;

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
        _http.post(_url + '/items/${item.id}/view', json.convert(_user))
            .catchError((error) {
                print(error);
            });
    }

    _addToLikeList(Item item) {
    }

    void _getNextItem() {
        _items.remove(currentItem);
        if (_items.isEmpty) {
            itemsLoaded = false;
            _getItems();
        }
    }

    void _getItems() {
        _http.get(_url + '/items')
            .then((HttpResponse response) {
                _items = response.data.map((data) => new Item.fromJson(data)).toList();
                itemsLoaded = true;
            })
            .catchError((error) {
                print(error);
                _items = new List();
            });
    }
}
