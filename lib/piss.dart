library piss;

import 'dart:convert';
import 'dart:async';
import 'package:angular/angular.dart';
import 'package:swipefashion/item.dart';
import 'package:swipefashion/user.dart';

@Injectable()
class PissService {
  static const String url = 'http://private-75680-pissapi.apiary-mock.com';
  final Http _http;

  PissService(Http this._http);

  void addToViewedList(Item item, User user) {
    JsonEncoder json = new JsonEncoder();
    _http.post(url + '/items/${item.id}/view', json.convert(user))
      .catchError((error) {
        print(error);
      });
  }

  Future<List> getItems() {
    return _http.get(url + '/items')
      .then((HttpResponse response) {
        return response.data.map((data) => new Item.fromJson(data)).toList();
      })
      .catchError((error) {
        print(error);
        return new List();
      });
  }
}
