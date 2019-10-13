import 'package:login/shared/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  FlutterSecureStorage storage;
  AuthService() {
    storage = new FlutterSecureStorage();
  }

  Future logOut() async {
    await storage.delete(key: 'user');
  }

  Future signIn(String email, String password) {
    return Future.delayed(Duration(seconds: 3), () async {
      if (email == 'rogerioa.sobrinho@gmail.com' && password == '123456789') {
        UserModel user = new UserModel(email: email, name: 'Rogerio Sobrinho');
        await storage.write(key: 'user', value: user.toJson().toString());
        return user;
      }

      return null;
    });
  }

  Future getUser() async {
    String value = await storage.read(key: 'user');
    return Future.value(value);
  }

  Future createUser({String name, String email, String senha}) {}
}
