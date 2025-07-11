import 'package:map_mvvm/map_mvvm.dart';
import 'package:karsome/models/user.dart';

abstract class RegistrationService with ServiceStream {
  Future<SystemUser> createUser();
}
