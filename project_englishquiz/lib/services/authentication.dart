import 'package:project_englishquiz/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_englishquiz/services/database.dart';

class AuthService{
  final FirebaseAuth _auth=FirebaseAuth.instance;


  userdata? _userFromFirebaseUser(User user) {
    return user != null? userdata(uid: user.uid) : null;
  }

  Stream<userdata?> get user{
    return _auth.authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user!));
  }

  Future signInWithEmailAndPassword(String email,String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  Future createUserWithEmailAndPassword(String email,String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      await DatabaseServices(uid: user!.uid).updateUserData(0, 'no name');
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}