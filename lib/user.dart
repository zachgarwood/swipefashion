library user;

import 'package:angular/angular.dart';
import 'package:lawndart/lawndart.dart';
import 'package:uuid/uuid.dart';

@Injectable()
class User {
  static const String userIdKey = 'userId';
  String id;
  Store store = new Store('SwipeFashion', 'Users');

  User() {
    store.open().then((_) {
      store.getByKey(userIdKey).then((value) {
        id = value;
        if (id == null) {
          var uuid = new Uuid();
          id = uuid.v5(Uuid.NAMESPACE_URL, Uri.base.host);
          store.save(id, userIdKey);
        }
      });
    });
  }

  Map toJson() {
    Map json = new Map();
    json['user_id'] = id;

    return json;
  }
}
