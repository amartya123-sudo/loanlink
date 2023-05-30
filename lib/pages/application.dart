import 'package:flutter/material.dart';
// import 'package:loanlink/pages/dashboard.dart';
// import 'package:loanlink/provider/function.dart';
// import 'package:loanlink/r_widgets/r_widgets.dart';
// import 'package:loanlink/provider/authentication.dart';

class BankingApplication extends StatefulWidget {
  const BankingApplication({super.key});

  @override
  State<BankingApplication> createState() => _BankingApplication();
}

class _BankingApplication extends State<BankingApplication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 5.0),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: GestureDetector(
                                  onTap: () => Navigator.pop(context)),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "New Loan Application",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          margin: const EdgeInsets.only(top: 20.0),
                          child: Column(
                              // children: [
                              // textfieldneo(
                              // readOnly: true,
                              // icon: Icons.account_circle_rounded,
                              // maxLines: 1,
                              // capitalization: TextCapitalization.none,
                              // hintText:
                              // ),
                              // ]
                              ),
                        )
                      ],
                    ),
                  )))),
    );
  }
}
