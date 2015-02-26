library user;

import 'package:angular/angular.dart';
import 'package:di/annotations.dart';
import 'package:lawndart/lawndart.dart';
import 'package:uuid/uuid.dart';

@Injectable()
class User {
    String id;

    User() {
        var store = new Store('SwipeFashion', 'Users');
        if (id == null) {
            var uuid = new Uuid();
            store.open().then((_) => store.save(uuid.v5(Uuid.NAMESPACE_URL, Uri.base.host), 'userId'));
        }
        store.open().then((_) => id = store.getByKey('userId'));
    }

    Map toJson() {
        Map json = new Map();
        json['user_id'] = id;

        return json;
    }
}
