import 'package:delhihackathon/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:delhihackathon/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// Future SigninAnon()async
// {
//   try{
//     UserCredential result =await _auth.signInAnonymously();
//     User? user =result.user;
// await DatabaseServices(uid: user?.uid).updateUserData("", "", "", "");
//     return user;
//   }
//   catch(e)
//   {
//     print(e.toString());
//     return null;
//   }
// }

  Future SignInwithEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user =result.user;
      return _userFromFirebase(user!);
    } catch (e) {
      print("*error*");
      print(e.toString());
      return null;
    }
  }

  Future RegisterwithEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      await DatabaseServices(uid: user?.uid).updateUserData('', '0', '', '0',
          // '','','','','','','','',
      );
      await DatabaseServices(uid: user?.uid).updateNgoData('', '', '', '', '', '', '', '', '', '');
      return _userFromFirebase(user!);
    } catch (e) {
      print("error");
      print(e.toString());
      return null;
    }
  }

  UserUid? _userFromFirebase(User? user) {
    if (user != null) {
      return UserUid(uid: user.uid);
    } else {
      return null;
    }
  }

  Stream<UserUid?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebase(user));
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
