import 'dart:convert';
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loanlink/model/banking_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:loanlink/model/user_model.dart';
import 'package:loanlink/pages/verify_otp.dart';
import 'package:loanlink/utils/util.dart';

class AuthProvider extends ChangeNotifier {
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _uid;
  String get uid => _uid!;
  UserModel? _userModel;
  UserModel get userModel => _userModel!;
  BankingModel? _bankingModel;
  BankingModel get bankingModel => _bankingModel!;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  AuthProvider() {
    checkSign();
  }

  void checkSign() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    _isSignedIn = sp.getBool("is_signedin") ?? false;
    notifyListeners();
  }

  Future setSignIn() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool("is_signedin", true);
    _isSignedIn = true;
    notifyListeners();
  }

  void signInVPhone(BuildContext context, String phoneNumber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await _firebaseAuth.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseAuthException error) {
            throw Exception(error.message);
          },
          codeSent: (String verificationId, int? resendToken) async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VerifyOtp(verificationId: verificationId, phoneNumber:phoneNumber),
              ),
            );
          },
          codeAutoRetrievalTimeout: ((verificationId) {}));
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
    }
  }

  void verifyOtp({
    required BuildContext context,
    required String verificationId,
    required String userOtp,
    required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      PhoneAuthCredential creds = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOtp);
      User? user = (await _firebaseAuth.signInWithCredential(creds)).user;

      if (user != null) {
        _uid = user.uid;
        onSuccess();
      }
      _isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> checkExistingUser() async {
    DocumentSnapshot snapshot =
        await _firebaseFirestore.collection("users").doc(_uid).get();
    if (snapshot.exists) {
      print("User Exists");
      print(_firebaseAuth.currentUser!.uid);
      return true;
    } else {
      print("New User");
      return false;
    }
  }

  void saveUserData({
    required BuildContext context,
    required UserModel userModel,
    required TextEditingController aadhar,
    required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      _userModel = userModel;

      await _firebaseFirestore
          .collection("users")
          .doc(_uid)
          .set(userModel.toMap());
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
      _isLoading = false;
      notifyListeners();
    }
  }

  void saveBankData({
    required BuildContext context,
    required BankingModel bankingModel,
    required Function onSave,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      _bankingModel = bankingModel;
      User? user = _firebaseAuth.currentUser;
      String? iden = user?.uid;
      await _firebaseFirestore
          .collection("banking")
          .doc(iden)
          .set(bankingModel.toMap());
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
      _isLoading = false;
      notifyListeners();
    }
  }

  Future getDataFromFirestore() async {
    await _firebaseFirestore
        .collection("users")
        .doc(_firebaseAuth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      _userModel = UserModel(
        name: snapshot['name'],
        email: snapshot['email'],
        phoneNumber: snapshot['phoneNumber'],
        address: snapshot['address'],
        aadhar: snapshot['aadhar'],
        pan: snapshot['pan'],
        createdAt: snapshot['createdAt'],
        uid: snapshot['uid'],
      );
      _uid = userModel.uid;
    });
  }

  Future saveUserDataSP() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString("user_model", jsonEncode(userModel.toMap()));
    notifyListeners();
  }

  Future saveBankDataSP() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString("banking_model", jsonEncode(bankingModel.toMap()));
  }

  Future getDataFromSP() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String data = sp.getString("user_model") ?? '';
    _userModel = UserModel.fromMap(jsonDecode(data));
    _uid = _userModel!.uid;
    notifyListeners();
  }

  Future userSignOut() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await _firebaseAuth.signOut();
    _isSignedIn = false;
    notifyListeners();
    sp.clear();
  }
}
