library user;

import 'package:angular/angular.dart';
import 'package:di/annotations.dart';

@Injectable()
class User {
    String id;

    User(this.id);
}
