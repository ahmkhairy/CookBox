import 'package:map_mvvm/viewmodel.dart';
import '../../models/user.dart';
import '../../services/user/user_service.dart';

class ProfileViewModel extends Viewmodel {
  final UserService _userService = UserService();

  Future<SystemUser> getUserInfo() async {
    return _userService.getUserInfo();
  }
}
