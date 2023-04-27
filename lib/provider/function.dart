import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
String getData(String uid, String coll, String key){
  String value="";
  final FirebaseFirestore db = FirebaseFirestore.instance;
  db.collection(coll).doc(uid).get().then((refvar) {
    value = refvar.get(key);
  });
  return value;
}

bool compareCreditScore(String reqAm) {
  String uid = _firebaseAuth.currentUser!.uid;
  double reqAmount = reqAm as double;
  String creditScore = getData(uid, "banking", "creditScore");
  int credit = creditScore as int;
  return (reqAmount<=credit);
}

double getCreditScore()
{
  String uid = _firebaseAuth.currentUser!.uid;
  String inc = getData(uid, "banking", "income");
  String exp = getData(uid, "banking", "expense");
  String loan = getData(uid, "banking", "loanType");
  String liab = getData(uid, "banking", "liabilities");
  double income = inc as double;
  double expense = exp as double;
  double loanType = loan as double;
  double liabilities = liab as double;

   
  double score = 0;
  double avgInc = income/3;
  // print(avgInc);
  double netExpense = (expense>(avgInc*0.4)?expense:(avgInc*0.4));
  // print(netExpense);
  double netInc = avgInc-netExpense-liabilities;
  // print(netInc);
  if(loanType=="Car Loan")
  {
    score = netInc*2;
  }
  else if (loanType == "Home Loan")
  {
    score = netInc*6;
  }
  return score;
}

void newApplication() {
  print("new application pressed");
}

void openSettings() {
  print("open settings pressed");
}

void openProfile() {
  print("open profile pressed");
}

void getCalender(BuildContext context) async {
  print("calendar pressed");
  // print(getCreditScore(300, 55, "Home Loan", 2));
  DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(3000));
}