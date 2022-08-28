import 'package:flutter/widgets.dart';
import 'package:assignment/services/user_api.dart';

enum HomeState {
  Initial,
  Loading,
  Loaded,
  Error,
}

class UserModel extends ChangeNotifier {
  // creating a userModel as the changeNotifier Provider
  HomeState _homeState = HomeState.Initial;
  List users = [];
  String message = '';

  UserModel() {
    _fetchUsers();
  }

  HomeState get homeState => _homeState;

  Future<void> _fetchUsers() async {
    // fetch users method to get all the users to the list
    _homeState = HomeState.Loading;
    try {
      await Future.delayed(Duration(seconds: 3));
      final apiusers = await UserApi.instance?.getAllUser();
      users = apiusers as List;
      _homeState = HomeState.Loaded;
    } catch (e) {
      message = '$e';
      _homeState = HomeState.Error;
    }
    //update ui by notifying the listeners
    notifyListeners();
  }
}
