import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_englishquiz/models/score.dart';
import 'package:project_englishquiz/models/user.dart';



class DatabaseServices{

  final String uid;
  DatabaseServices({required this.uid});

  final CollectionReference scoreCollection=FirebaseFirestore.instance.collection('score');

  Future updateUserData(int scores, String name) async{
    return await scoreCollection.doc(uid).set({
      'score':scores,
      'name':name,
    });
  }

  //data list snapshot
  List<Score> _scoreList(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Score(
        scores: doc.get('score') ?? 0,
        name: doc.get('name')?? ''
      );
    }).toList();
  }
  
  //data from user snapshot
  DataFromUser _DataFromUserSnapshot(DocumentSnapshot snapshot){
    return DataFromUser(
        uid: uid, 
        scores: snapshot.get('score'),
        name: snapshot.get('name')
    );
  }

  //get data stream
  Stream<List<Score>> get score {
    return scoreCollection.snapshots()
      .map(_scoreList);
  }

  //get user doc stream
  Stream<DataFromUser> get dataFromUser{
    return scoreCollection.doc('uid').snapshots()
      .map(_DataFromUserSnapshot);
  }
}