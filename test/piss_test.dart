import 'package:swipefashion/piss.dart';
import 'package:guinness/guinness.dart';
import 'package:dartmocks/dartmocks.dart';
import 'package:angular/angular.dart';
import 'dart:async';
import 'dart:convert';

@proxy class _Http extends TestDouble implements Http {}

@proxy class _HttpResponse extends TestDouble implements HttpResponse { var data; }

main () {
  fakeResponse(data) => new Future.value(new _HttpResponse()..data = JSON.decode(data));

  describe('PissService', () {
    it('should get items', () {
      final http = new _Http();
      http.stub('get').args(PissService.url + '/items').andReturn(
        fakeResponse('''
          [
            {
              "id": 1, "name": "Black dress", "price": 49.99, "url": "http://example.com", "image": "http://met.live.mediaspanonline.com/assets/31069/example-608web_w608.jpg"
            }, {
              "id": 2, "name": "Red dress", "price": 159.99, "url": "http://example.com", "image": "http://domaingang.com/wp-content/uploads/2012/02/example.png"
            }, {
              "id": 3, "name": "Green dress", "price": 9.99, "url": "http://example.com", "image": "http://www.trythisforexample.com/images/examplenew.png"
            }, {
              "id": 4, "name": "Blue dress", "price": 79.99, "url": "http://example.com", "image": "https://developer.chrome.com/extensions/examples/api/idle/idle_simple/sample-128.png"
            }
          ]
        '''));

      final piss = new PissService(http);
      piss.getItems().then((items) {
        expect(items.length).toEqual(4);
        items.forEach((item) {
          // Is there a way to access object properties dynamically?
          expect(item.id).toBeDefined();
          expect(item.name).toBeDefined();
          expect(item.price).toBeDefined();
          expect(item.url).toBeDefined();
          expect(item.image).toBeDefined();
        });
      });
    });
  });
}