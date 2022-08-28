import 'package:assignment/models/user.dart';
import 'package:dio/dio.dart';
class UserApi {
  // using the Encapsulation to call API instance
  static  UserApi? _instance;
  UserApi._();

  static UserApi? get instance {
    if (_instance == null) {
      _instance = UserApi._();
    }
    return _instance;
  }

  Future getAllUser() async {
    //using the dio to connecto to the baseURL as GET to fetch the required data
    final getUser = await Dio().get('http://jsonplaceholder.typicode.com/users');
    return getUser.data.map((e) => User.fromJson(e)).toList();
  }
}
