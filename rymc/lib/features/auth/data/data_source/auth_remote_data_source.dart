import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rymc/common/services/server_service.dart';
import 'package:rymc/common/utils/fields.dart';
import 'package:rymc/features/auth/data/firebase_collections/users_collections.dart';
import 'package:rymc/features/auth/data/model/user_model.dart';

abstract class IAuthRemoteDataSource {
  /*  Future<void> signIn({
    required String phone,
  });
    Future<String> verifyCode({
    required String sms,
  });
   */

  Future<void> register({
    required UserModel user,
  });
  Future<void> logOut();

  Future<UserModel?> isSignInBefore({
    required String uid,
  });

  Future<Unit> removeAccount();
}

class AuthRemoteDataSource implements IAuthRemoteDataSource {
/*   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  AuthRemoteDataSource();

  /// come from firebase
  static String _verificationId = '';

  /// come from firebase
  static int? _forceResendingToken; */

  @override
  Future<Unit> removeAccount() async {
    return unit;
  }

  @override
  Future<void> register({required UserModel user}) async {
    try {
      await UsersCollection.instance.addUser(user);
    } on SocketException {
      ServerService<void>().timeOutMethod(
        () => register(
          user: user,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

/*   @override
  Future<void> signIn({required String phone}) async {
    try {
      log(phone);
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        forceResendingToken: _forceResendingToken,
        codeSent: (String verificationId, int? forceResendingToken) {
          log(" ---> Sent");

          _verificationId = verificationId;
          _forceResendingToken = forceResendingToken;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
        timeout: Duration(seconds: AppConstants.timeOut),
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
        verificationFailed: (FirebaseAuthException error) {
          log(" Error---> $error");
          if (error.code == Fields.invalidPhoneNumber) {
            Utils.showError('time Out');
          } else {
            Utils.showError(error.message ?? "Error Sent code");
          }
        },
      );
    } on SocketException {
      ServerService<void>().timeOutMethod(
        () => signIn(
          phone: phone,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> verifyCode({required String sms}) async {
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: sms);

      UserCredential user = await firebaseAuth.signInWithCredential(credential);

      return user.user!.uid;
    } on SocketException {
      return ServerService<String>().timeOutMethod(() => verifyCode(sms: sms));
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
 */

  @override
  Future<UserModel?> isSignInBefore({required String uid}) async {
    try {
      //Check if already Sign Up
      final QuerySnapshot resultQuery = await FirebaseFirestore.instance
          .collection(Collections.Users)
          .doc(uid)
          .collection(Collections.UsersData)
          .where("uid", isEqualTo: uid)
          .get();

      final List<DocumentSnapshot> documentSnapshot = resultQuery.docs;

      /// if not add before
      if (documentSnapshot.isEmpty) {
        return null;
      } else {
        return await UsersCollection().getUser(uid: uid);
      }
    } on SocketException {
      return ServerService<UserModel?>().timeOutMethod(
        () => isSignInBefore(uid: uid),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on SocketException {
      return ServerService<void>().timeOutMethod(
        () => logOut(),
      );
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
