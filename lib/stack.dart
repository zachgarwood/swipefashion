library stack;

import 'dart:html';
import 'package:angular/angular.dart';
import 'package:swipefashion/item.dart';

@Component(
    selector: 'stack',
    templateUrl: 'stack.html'
)
class StackComponent {
    bool itemsLoaded = false;
    List<Item> _items = new List();
    final Http _http;

    StackComponent(this._http) {
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
        _http.get('http://private-75680-swipefashion.apiary-mock.com/items')
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
