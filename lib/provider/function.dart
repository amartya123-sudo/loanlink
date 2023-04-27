import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


void getCreditScore2() {
//Todo: add _phone from login page
String _phone="639463984s";
  final FirebaseFirestore db = FirebaseFirestore.instance;
  // db.collection("users").doc("ll20229876").get().then((value) {print(value);});
  // db.collection("users").where("phone", isEqualTo: _phone).get().then(
  db.collection("users").doc("ll20229876").get().then(
      (querySnapshot) {
        print("Successfully completed");
        print('${querySnapshot.get("phoneNumber")}');
        // for (var docSnapshot in querySnapshos) {
        //   print('${docSnapshot.id} => ${docSnapshot.data()}');
        // }
        
      },
      onError: (e) => print("Error completing: $e"),
    );

}
String getData(String uid, String coll, String key){
  String value="";
  final FirebaseFirestore db = FirebaseFirestore.instance;
  db.collection(coll).doc(uid).get().then((refvar) {
    value = refvar.get(key);
  });
  return value;
}

bool compareCreditScore(String uid, String reqAm) {
  double reqAmount = reqAm as double;
  String creditScore = getData(uid, "banking", "creditScore");
  int credit = creditScore as int;
  return (reqAmount<=credit);
}

double getCreditScore(String inc, String exp, String loanType, String liab)
{
  double income = inc as double;
  double expense = exp as double;
  double loan = loanType as double;
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