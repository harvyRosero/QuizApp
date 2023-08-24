import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz/util/shared_pref.dart';

class FirebaseService {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final Preferences preferences = Preferences();  


  Future<List<Map<String, dynamic>>> getDataByUserId(String userId) async {

    List<Map<String, dynamic>> listaDatos = [];
 
    try{
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await db.collection('users')
            .where('userId', isEqualTo: userId)
            .get();

      for (var documentSnapshot in snapshot.docs) {
        Map<String, dynamic> datos = documentSnapshot.data();
        listaDatos.add(datos);
      }

      return listaDatos;
    }catch (e){
      return [];
    }

  }

  Future<String> signInWithEmail( 
    String email_, 
    String password_
    ) async {
    try{
      UserCredential userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email_, password: password_);
      
      String name = userCredential.user!.displayName.toString();
      String email = userCredential.user!.email.toString();
      String userId = userCredential.user!.uid.toString();

      preferences.savePreferenceLogin(email, name, userId);

      
      

    }catch (e){
      return 'Oops! Ocurrio un error, verifica tu informacion y vuelve a intentarlo';
    }
    return 'ok';
  }

  Future<bool> addUserData(
    String userId, 
    String email, 
    String name, 
    String cedula,  
    String edad, 
    String genero,  
    String experiencia,  
    String nivel)async {

    CollectionReference participaciones =  db.collection('users');
  
    try{
        await participaciones.add({
        'userId': userId,
        'email': email,
        'name': name,
        'cedula': cedula,
        'edad': edad,
        'genero': genero,
        'experiencica': experiencia,
        'nivel': nivel
      });

    }catch (e){
      return false;

    }
  return true;
  }

  Future<bool> addUserResult(
    String userId, 
    String fecha, 
    String puntaje, 
    String state, 
    String name,
    String email,
    String cedula,
    String edad,
    String genero,
    String nivel,
    String experiencia
    )async {

    CollectionReference results =  db.collection('resultados');
  
    try{
        await results.add({
        'userId': userId,
        'fecha': fecha,
        'puntaje': puntaje,
        'estado': state,
        'name': name,
        'email': email,
        'cedula':cedula,
        'edad': edad,
        'genero': genero,
        'nivel': nivel,
        'experiencia': experiencia
      });

    }catch (e){
      return false;

    }
  return true;
}


  Future<UserCredential> createUser(email_, pass_, name, cedula, edad, genero, experiencia, nivel) async {
    late UserCredential userCredential;
   
    try{
      userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: email_, password: pass_);

      String userId = userCredential.user!.uid.toString();
      addUserData(userId, email_, name, cedula, edad, genero, experiencia, nivel);
      return userCredential;

    }catch (e){
      return userCredential;
    }

    
  }

  Future<void> resetPassword(email_) async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email_);
  }

  Future<void> signOut() async {
    await auth.signOut();
    preferences.clearPreferences();
  }

  
}
