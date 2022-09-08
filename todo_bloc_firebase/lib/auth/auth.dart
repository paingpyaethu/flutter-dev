import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  Future<Map<String, dynamic>> register(
      String userEmail, String userPassword) async {
    Map<String, dynamic> res = {"status": false};
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userEmail, password: userPassword);
      res['status'] = true;
    } catch (e) {
      print(e);
    }
    return res;
  }
}
