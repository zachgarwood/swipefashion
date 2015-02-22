library user;

import 'package:angular/angular.dart';
import 'package:di/annotations.dart';

@Injectable()
class User {
    String id;

    User(this.id);

    Map toJson() {
        Map json = new Map();
        json['user_id'] = id;

        return json;
    }
}
