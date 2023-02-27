import 'package:carrental/Models/TheUser.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth{

  TheUser? _CoustumUserData(User? user) {
    return user != null ? TheUser(uid: user.uid, Name: '', PNumber: '', Email: '', DriverLicense: '') : null;
  }

  Stream<TheUser?> get user {
    return FirebaseAuth.instance.authStateChanges().map((User? user) => _CoustumUserData(user));
  }

  Future SignInWithEmailPassword(String Email , String Password) async{
    try {
      UserCredential SignInResult = await FirebaseAuth.instance.signInWithEmailAndPassword(email: Email, password: Password);
      User? UserResult = SignInResult.user;
      return _CoustumUserData(UserResult);
    }catch(e){
      print(e.toString());
    }
  }

  Future SignOut() async {
    try {
      return await FirebaseAuth.instance.signOut();
    } catch (e) {
      return print(e.toString());
    }
  }

}