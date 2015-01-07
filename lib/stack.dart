library stack;

import 'dart:html';
import 'package:angular/angular.dart';
import 'package:swipefashion/item.dart';

@Component(
    selector: 'stack',
    templateUrl: 'stack.html'
)
class StackComponent {
    List<Item> items;
    Item currentItem;

    StackComponent() {
        items = _loadData();
        currentItem = items.first;
    }

    void pass() {
        _getNextItem();
        _addToViewedList(currentItem);
    }

    void like() {
        _addToLikeList(currentItem);
        _addToViewedList(currentItem);
        _getNextItem();
    }

    void view() {
        window.open(currentItem.url, 'external');
    }

    _addToViewedList(Item item) {
    }

    _addToLikeList(Item item) {
    }

    void _getNextItem() {
        items.remove(currentItem);
        currentItem = items.first;
    }

    List<Item> _loadData() {
        return [
            new Item(
                'red dress',
                49.99,
                'http://met.live.mediaspanonline.com/assets/31069/example-608web_w608.jpg',
                'http://met.live.mediaspanonline.com/assets/31069/example-608web_w608.jpg'
            ),
            new Item(
                'black dress',
                69.99,
                'http://domaingang.com/wp-content/uploads/2012/02/example.png',
                'http://domaingang.com/wp-content/uploads/2012/02/example.png'
            ),
        ];
    }
}
